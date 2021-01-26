import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitachi/ChangeListener/loginListener.dart';
import 'package:vitachi/pages/TextFieldWidget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final Color color = Color(0xFF3D6845);

class _LoginState extends State<Login> {
  final eingaben = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                color: Color(0xffbbedc5),
                height: MediaQuery.of(context).size.height / 3,
              ),
              Center(
                child: Container(
                  color: Color(0xffbbedc5),
                  height: MediaQuery.of(context).size.height / 3,
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 0, MediaQuery.of(context).size.height / 16),
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                ),
              ),
            ]),
            Container(
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
                            height: MediaQuery.of(context).size.height / 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 15,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF3D6845),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: () {
                                  if (eingaben.currentState.validate()) {
                                    // Process data.
                                    Navigator.pushNamed(context, '/');
                                  }
                                },
                                child: Text('Login',
                                    style: TextStyle(color: Colors.white))),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 90,
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
          ],
        ),
      ),
    );
  }
}
