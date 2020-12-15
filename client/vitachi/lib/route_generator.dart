import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:vitachi/main.dart';
import 'package:vitachi/pages/Essen.dart';
import 'package:vitachi/pages/EssenNav.dart';
import 'package:vitachi/pages/home.dart';
import 'package:vitachi/pages/statistics.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/statistics':
        return MaterialPageRoute(builder: (_) => Statistics());
      case '/eingabeNav':
        return MaterialPageRoute(builder: (_) => EingabenNav());
      case '/essen':
        return MaterialPageRoute(builder: (_) => Essen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: MyAppBar(null, 'Error', null),
        body: Center(
          child: Text('Error'),
        ),
        drawer: MyDrawer(),
      );
    });
  }
}
