import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:http/http.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final eingaben = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xffbbedc5),
    body: Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/16, 0, MediaQuery.of(context).size.height/16),
            child: Image(
              image: AssetImage('assets/logo.png'),
            ),
          ),
          flex: 2,
        ),
        Expanded(
                child: Container(

                  child: Column(
                    children: [
                      Container(
                        //margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/4, 0, MediaQuery.of(context).size.height/4),
                        child:
                            Form(
                              key: eingaben,
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height/16,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height/12,
                                    width: MediaQuery.of(context).size.width/1.5,
                                    child: Card(
                                      child: Center(
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            hintText: 'Benutzername',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Bitte gib einen Benutzernamen ein';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      elevation: 5,
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height/32,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height/12,
                                    width: MediaQuery.of(context).size.width/1.5,
                                    child: Card(
                                      child: Center(
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            hintText: 'Passwort',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Bitte gib ein Passwort ein';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      elevation: 5,
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height/8,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF3D6845),
                                      ),
                                    onPressed: () {
                                      if (eingaben.currentState.validate()) {
                                        // Process data.
                                        Navigator.pushNamed(context, '/');
                                      }
                                    },
                                    child: Text('Login', style: TextStyle(color: Colors.white))
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height/32,
                                  ),
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.pushReplacementNamed(context, '/register');
                                    },
                                    child: Text("Registrieren", style: TextStyle(color: Colors.white),),
                                    color: Color(0xFF3D6845),
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
                flex: 4,
              ),
      ],
    ),


    );
  }
}
