import 'package:flutter/material.dart';
import 'package:vitachi/pages/home.dart';
import 'package:vitachi/route_generator.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
