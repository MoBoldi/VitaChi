import 'package:flutter/material.dart';
import 'package:vitachi/pages/Essen.dart';
import 'package:vitachi/pages/EssenNav.dart';
import 'file:///C:/Users/noahs/OneDrive/Dokumente/Schule/VitaChi/VitaChi/client/vitachi/lib/pages/home.dart';
import 'file:///C:/Users/noahs/OneDrive/Dokumente/Schule/VitaChi/VitaChi/client/vitachi/lib/pages/statistics.dart';

void main() {
  runApp(MaterialApp(
      home: Home(),
    routes: {
        '/home': (context) => Home(),
        '/eingabeNav': (context) => EingabenNav(),
        '/statistics': (context) => Statistics(),
        '/essen': (context) => Essen()
    },
  ));
}

