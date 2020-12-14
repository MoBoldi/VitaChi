import 'package:flutter/material.dart';
import 'package:vitachi/pages/Essen.dart';
import 'package:vitachi/pages/EssenNav.dart';
import 'package:vitachi/pages/home.dart';
import 'package:vitachi/pages/statistics.dart';
import 'package:vitachi/route_generator.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      /*routes: {
      '/home': (context) => Home(),
      '/eingabeNav': (context) => EingabenNav(),
      '/statistics': (context) => Statistics(),
      '/essen': (context) => Essen()
    },*/
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
