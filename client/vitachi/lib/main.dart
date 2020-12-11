import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vitachi/statistics.dart';
import 'home.dart';
import 'statistics.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      //'/': (context) => Loading(),
      '/home': (context) => Home(),
      '/statistics': (context) => Statistics(),
    },
  ));
}
