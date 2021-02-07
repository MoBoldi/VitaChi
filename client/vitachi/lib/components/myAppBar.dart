import 'package:flutter/material.dart';

Widget MyAppBar(BuildContext context, String title, dynamic otherData) {
  return AppBar(
    title: Text('$title'),
    centerTitle: true,
    backgroundColor: Color(0xFF017ebe),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/eingabeNav');
        },
      )
    ],
  );
}
