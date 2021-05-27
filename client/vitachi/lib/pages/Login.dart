import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitachi/ChangeListener/loginListener.dart';
import 'package:vitachi/pages/TextFieldWidget.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

import 'WaveWidget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final Color color = Color(0xff3f8ee9);

TextEditingController usernameController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class _LoginState extends State<Login> {
  final eingaben = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xff3f8ee9), Color(0xff5db4ec)]),
                ),
                height: MediaQuery.of(context).size.height / 2,
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 20000),
                child: WaveWidget(
                  size: size,
                  yOffset: size.height / 3,
                  color: Colors.white,
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  margin: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height / 25, 0, 0),
                  child: Image(
                    image: AssetImage('assets/Logo_Design_03.png'),
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.5),
                child: Column(
                  children: [
                    Container(
                      child: Form(
                        key: eingaben,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 16,
                            ),
                            TextFieldWidget(
                              hintText: 'Benutzername',
                              prefixIconData: Icons.person_outline,
                              obscureText: false,
                              controller: usernameController,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 32,
                            ),
                            TextFieldWidget(
                              hintText: 'Passwort',
                              prefixIconData: Icons.lock_outline,
                              obscureText: true,
                              controller: passwordController,
                            ),
                            /*SizedBox(
                                        width: MediaQuery.of(context).size.width/1.2,
                                        child: TextFieldWidget(
                                          hintText: 'Benutzername',
                                          obscureText: false,
                                          prefixIconData: Icons.person_outline,
                                        ),
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height/32,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/1.2,
                                        child: TextFieldWidget(
                                          hintText: 'Passwort',
                                          obscureText: true,
                                          prefixIconData: Icons.lock_outline,
                                        ),
                                      ),*/
                            Container(
                              height: MediaQuery.of(context).size.height / 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff3f8ee9),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50))),
                                  onPressed: () {
                                    Future<bool> response = getData();
                                    response.then((value) => {
                                      if (eingaben.currentState.validate() && value == true) {

                                        usernameController.clear(),
                                        passwordController.clear(),

                                        Navigator.pushNamed(context, '/')
                                      }
                                    });
                                  },
                                  child: Text('Login',
                                      style: TextStyle(color: Colors.white))),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 70,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/register');
                                },
                                child: Text("Registrieren",
                                    style: TextStyle(color: Colors.black)),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: color,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            )
                          ],
                        ),
                      ),
                      color: Colors.white,
                    )
                  ],
                ),
                color: Colors.white,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

Future<bool> getData() async {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final authorizationEndpoint =
  Uri.parse('http://10.0.2.2:8010/auth/realms/vitachi/protocol/openid-connect/token');

  final username = usernameController.text;
  final password = passwordController.text;

  final identifier = 'vitachi-client';
  final secret = '6c6151b2-ea27-42fc-97fd-b05c42eebf4f';

  try {
    var client = await oauth2.resourceOwnerPasswordGrant(
        authorizationEndpoint, username, password,
        identifier: identifier, secret: secret);

    String url = 'http://10.0.2.2:8080/vitaChi/getUser';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(<String, Object>{'token': client.credentials.accessToken});
    Response response = await post(url, headers: headers, body: json);

    final SharedPreferences prefs = await _prefs;

    prefs.remove("UserID");
    prefs.remove("accessToken");
    prefs.remove("refreshToken");
    prefs.commit();

    prefs.setInt("UserID", jsonDecode(response.body));
    prefs.setString("accessToken", client.credentials.accessToken);
    prefs.setString("refreshToken", client.credentials.refreshToken);

    return true;
  } catch (error) {
    return false;
  }
}