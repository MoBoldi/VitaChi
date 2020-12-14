import 'package:flutter/material.dart';
import 'package:vitachi/pages/EssenNav.dart';
import 'package:vitachi/home.dart';
import 'package:vitachi/statistics.dart';

void main() {
  runApp(MaterialApp(
      home: Home(),
    routes: {
        '/home': (context) => Home(),
        '/eingabeNav': (context) => EingabenNav(),
        '/statistics': (context) => Statistics()
    },
  ));
}

