import 'package:flutter/material.dart';

Widget MyAppBar(BuildContext context, String title, dynamic otherData) {
  final size = MediaQuery.of(context).size;
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    title: Text('$title'),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    actions: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(size.width/50,size.height/70,size.width/40,size.height/70),
        width: size.width/4,
        decoration: new BoxDecoration(
            color: Color(0xff5dacde),
            borderRadius: new BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("243 ",
              style: TextStyle(color: Colors.white, fontSize: size.width/23)),
            Icon(
              Icons.monetization_on_outlined,
              color: Colors.amberAccent,
            ),
          ],
        ),
      )
    ],
  );
}
