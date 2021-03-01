import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Wohnzimmer extends StatefulWidget {
  @override
  _WohnzimmerState createState() => _WohnzimmerState();
  Map data;
  final List<ChartData> ges = [
    ChartData('Wellbeing', 3, Color(0xFF4DA8DA)),
    ChartData('', 2, Color(0xFF9dc6dd)),
  ];

  List<ChartData> food = [
    ChartData('Food', 5, Color(0xFF4DA8DA)),
    ChartData('', 1, Color(0xFF9dc6dd)),
  ];
}

class _WohnzimmerState extends State<Wohnzimmer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBarWohnzimmer(context, 'VitaChi', null),
      drawer: MyDrawer(),
      body: Container(
          foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Blume_Placeholder.png"))),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/boden.jpg"), fit: BoxFit.fill),
          ),
          child: Stack(
            children: <Widget>[
              // Image(image: AssetImage("assets/Blume_Placeholder.png")),
              Align(
                alignment: Alignment.topCenter,
                child: Material(
                  elevation: 15.0,
                  child: Container(
                      height: size.height / 3, color: Color(0xFFf7eeda)),
                ),
              ),
            ],
          )),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  double y;
  final Color color;
}

AssetImage getEmotion(double wellbeing) {
  if (1 <= wellbeing && wellbeing < 2) {
    return AssetImage('assets/Blume_1.png');
  } else if (2 <= wellbeing && wellbeing < 3) {
    return AssetImage('assets/Blume_2.png');
  } else if (3 <= wellbeing && wellbeing < 4) {
    return AssetImage('assets/Blume_3.png');
  } else if (4 <= wellbeing && wellbeing < 4.5) {
    return AssetImage('assets/Blume_4.png');
  } else if (4.5 <= wellbeing && wellbeing <= 5) {
    return AssetImage('assets/Blume_5.png');
  } else {
    return AssetImage('assets/Blume_3.png');
  }
}
