import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:vitachi/components/myDrawer.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: MyAppBarEingaben(context, 'VitaChi', null),
        drawer: MyDrawer(),
        body: Column(
          children: [
              Container(
                color: Color(0xff82b086),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("SETTINGS", style: TextStyle(fontSize: size.height/25, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
                width: size.width,
                height: size.height/5,
              )
          ],
        )
    );
  }
}
