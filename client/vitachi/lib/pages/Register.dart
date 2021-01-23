import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitachi/pages/TextFieldWidget.dart';
import 'package:vitachi/pages/WaveWidget.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final eingaben = GlobalKey<FormState>();
  final Color color = Color(0xFF3D6845);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                children: [
                  Container(
                    color: Color(0xffbbedc5),
                    height: MediaQuery.of(context).size.height/2,
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
                      color: Color(0xffbbedc5),
                      height: MediaQuery.of(context).size.height/3.5,

                      margin: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height/16),
                      child: Image(
                        image: AssetImage('assets/logo.png'),
                        width: MediaQuery.of(context).size.width/1.5,
                      ),
                    ),
                  ),
                  Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.5),
                    child: Column(
                      children: [
                        Container(
                          //margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/4, 0, MediaQuery.of(context).size.height/4),
                          child:
                          Form(
                            key: eingaben,
                            child: Column(
                              children: [

                                TextFieldWidget(
                                  hintText: 'Benutzername',
                                  prefixIconData: Icons.person_outline,
                                  obscureText: false,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height/32,
                                ),
                                TextFieldWidget(
                                  hintText: 'EMail',
                                  prefixIconData: Icons.mail_outline,
                                  obscureText: false,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height/32,
                                ),
                                TextFieldWidget(
                                  hintText: 'Passwort',
                                  prefixIconData: Icons.lock_outline,
                                  obscureText: true,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height/15,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width/1.2,
                                  height: MediaQuery.of(context).size.height/15,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xFF3D6845),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50)
                                          )
                                      ),

                                      onPressed: () {
                                        if (eingaben.currentState.validate()) {
                                          // Process data.
                                          Navigator.pushNamed(context, '/');
                                        }
                                      },
                                      child: Text('Registrieren', style: TextStyle(color: Colors.white))
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height/90,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width/1.2,
                                  height: MediaQuery.of(context).size.height/15,
                                  child: FlatButton(
                                    onPressed: (){
                                      Navigator.pushReplacementNamed(context, '/login');
                                    },
                                    child: Text("Zurück", style: TextStyle(color: Colors.black)),
                                    shape: RoundedRectangleBorder(side: BorderSide(
                                        color: color,
                                        width: 1,
                                        style: BorderStyle.solid
                                    ),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
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
                ]
            ),


          ],
        ),
      ),


    );
  }
}
