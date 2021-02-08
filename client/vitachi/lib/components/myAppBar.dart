import 'package:flutter/material.dart';

Widget MyAppBar(BuildContext context, String title, dynamic otherData) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    title: Text('$title'),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.add, color: Colors.black),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/eingabeNav');
        },
      )
    ],
  );
}
