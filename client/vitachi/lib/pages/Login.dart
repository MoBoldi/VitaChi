import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitachi/ChangeListener/loginListener.dart';
import 'package:vitachi/pages/TextFieldWidget.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'WaveWidget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final Color color = Color(0xff3f8ee9);

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
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 32,
                            ),
                            TextFieldWidget(
                              hintText: 'Passwort',
                              prefixIconData: Icons.lock_outline,
                              obscureText: true,
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
                                    getData();
                                    if (eingaben.currentState.validate()) {
                                      // Process data.
                                      Navigator.pushNamed(context, '/');
                                    }
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

Future<void> getData() async {

  final authorizationEndpoint =
  Uri.parse('http://10.0.2.2:8080/auth/realms/vitachi/protocol/openid-connect/token');

  final username = 'testuser2';
  final password = 'Test1234';

  final identifier = 'vitachi-client';
  final secret = '6c6151b2-ea27-42fc-97fd-b05c42eebf4f';

  var client = await oauth2.resourceOwnerPasswordGrant(
      authorizationEndpoint, username, password,
      identifier: identifier, secret: secret);

  print(client.credentials.);
}
