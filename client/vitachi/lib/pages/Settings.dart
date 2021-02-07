import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:flutter_spinbox/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final color = Color(0xff5bc7e3);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: MyAppBarWhite(context, 'VitaChi', null),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
                Container(
                  margin: EdgeInsets.only(left: size.width/25),
                  child: Text("SETTINGS", style: TextStyle(fontSize: size.width/15),),
                  width: size.width,
                ),
                Container(
                margin: EdgeInsets.fromLTRB(size.width/20, size.height/10, size.width/20,0),
                child: TextFormField(
                  initialValue: 'Benutzername',
                  style: TextStyle(
                      color: color,
                      fontSize: 18
                  ),
                  cursorColor: color,
                  obscureText: false,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(height: 0),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      size: MediaQuery.of(context).size.height/35,
                      color: color,
                    ),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color)
                    ),

                    labelStyle: TextStyle(color: color),
                    focusColor: color,

                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Text("Hier kannst du deinen Benutzernamen ändern.", style: TextStyle(fontSize: size.width/30, color: Colors.grey),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(size.width/20, size.height/20, size.width/20,0),
                child: TextFormField(
                  initialValue: 'E-Mail',
                  style: TextStyle(
                      color: color,
                      fontSize: 18
                  ),
                  cursorColor: color,
                  obscureText: false,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(height: 0),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      size: MediaQuery.of(context).size.height/35,
                      color: color,
                    ),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color)
                    ),

                    labelStyle: TextStyle(color: color),
                    focusColor: color,

                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Text("Hier kannst du deine E-Mail Adresse ändern.", style: TextStyle(fontSize: size.width/30, color: Colors.grey),),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height/10),
                width: size.width/5,
                child: SpinBox(
                  min: 1.0,
                  max: 168.0,
                  value: 38.5,
                  decimals: 1,
                  direction: Axis.vertical,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => print(value),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(size.width/20, 0, size.width/20,0),
                child: Text("In den Statistiken wird Standardmäßig mit den Wert 38,5 Stunden Arbeitszeit pro Woche gerechnet. "
                    "Hier kannst du einstellen wie viele Stunden du pro Woche arbeitest und somit die Statistik an dich anpassen.",
                  style: TextStyle(fontSize: size.width/30, color: Colors.grey),
                ),
              ),

            ],
          ),
        )
    );
  }
}
