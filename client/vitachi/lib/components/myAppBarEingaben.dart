import 'package:flutter/material.dart';

Widget MyAppBarEingaben(BuildContext context, String title, dynamic otherData) {
  return AppBar(
    centerTitle: true,
    backgroundColor:  Color(0xff82b086),
    elevation: 0.0,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.add, color: Colors.white),
        onPressed: null,
      )
    ],
  );
}
