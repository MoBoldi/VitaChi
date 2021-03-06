import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:vitachi/pages/Arbeit.dart';
import 'package:vitachi/pages/Bewegung.dart';
import 'package:vitachi/pages/Essen.dart';
import 'package:vitachi/pages/EssenNav.dart';
import 'package:vitachi/pages/Freunde.dart';
import 'package:vitachi/pages/Login.dart';
import 'package:vitachi/pages/Register.dart';
import 'package:vitachi/pages/Schlafen.dart';
import 'package:vitachi/pages/Settings.dart';
import 'package:vitachi/pages/Shop.dart';
import 'package:vitachi/pages/StatsBewegung.dart';
import 'package:vitachi/pages/StatsEssen.dart';
import 'package:vitachi/pages/StatsSchlafen.dart';
import 'package:vitachi/pages/Wohnzimmer.dart';
import 'package:vitachi/pages/aufgaben.dart';
import 'package:vitachi/pages/detail_freunde.dart';
import 'package:vitachi/pages/detail_shop.dart';
import 'package:vitachi/pages/home.dart';
import 'package:vitachi/pages/statistics.dart';
import 'package:vitachi/pages/statisticsNav.dart';
import 'pages/Wellbeing.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/statisticsNav':
        return MaterialPageRoute(builder: (_) => StatisticsNav());
      case '/eingabeNav':
        return MaterialPageRoute(builder: (_) => EingabenNav());
      case '/essen':
        return MaterialPageRoute(builder: (_) => Essen());
      case '/wellbeing':
        return MaterialPageRoute(builder: (_) => Wellbeing());
      case '/bewegung':
        return MaterialPageRoute(builder: (_) => Bewegung());
      case '/schlafen':
        return MaterialPageRoute(builder: (_) => Schlafen());
      case '/arbeit':
        return MaterialPageRoute(builder: (_) => Arbeit());
      case '/shop':
        return MaterialPageRoute(builder: (_) => Shop());
      case '/detailShop':
        return MaterialPageRoute(builder: (_) => DetailShop());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/aufgaben':
        return MaterialPageRoute(builder: (_) => Aufgabe());
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());
      case '/freunde':
        return MaterialPageRoute(builder: (_) => Freunde());
      case '/wohnzimmer':
        return MaterialPageRoute(builder: (_) => Wohnzimmer());
      case '/statsEssen':
        return MaterialPageRoute(builder: (_) => StatsEssen());
      case '/statsBewegung':
        return MaterialPageRoute(builder: (_) => StatsBewegung());
      case '/statsSchlafen':
        return MaterialPageRoute(builder: (_) => StatsSchlafen());
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
