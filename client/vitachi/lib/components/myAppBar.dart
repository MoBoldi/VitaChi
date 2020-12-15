import 'package:flutter/material.dart';

Widget MyAppBar(BuildContext context, String title, dynamic otherData) {
  return AppBar(
    title: Text('$title'),
    centerTitle: true,
    backgroundColor: Colors.purpleAccent,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.add, color: Colors.white),
        onPressed: null,
      )
    ],
  );
}
