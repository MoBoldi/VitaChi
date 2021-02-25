import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape/arc.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';

class DetailFreunde extends StatelessWidget {
  Map data;

  final List<ChartData> ges = [
    ChartData('Wellbeing', 3, Color(0xFF4DA8DA)),
    ChartData('', 2, Color(0xFF9dc6dd)),
  ];

  List<ChartData> food = [
    ChartData('Food', 5, Color(0xFF4DA8DA)),
    ChartData('', 1, Color(0xFF9dc6dd)),
  ];

  DetailFreunde({@required this.data});

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: MyAppBarWhite(context, 'VitaChi', null),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Color(0xff4491eb), Color(0xff5dacde)]),
          ),
          child: Stack(
            children: [
              Container(
                //Erster weißer Background
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                child: ShapeOfView(
                  elevation: 10,
                  shape: ArcShape(
                    direction: ArcDirection.Outside,
                    position: ArcPosition.Bottom,
                    height: 20,
                  ),
                  child: Container(
                    child: Image(
                      image: getEmotion(food[0].y),
                    ),
                    /*decoration: BoxDecoration(
                        boxShadow: 
                    ),*/
                  ),
                ),
              ),
              /*Container(//Text 
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height / 2.45, 0, 0),
                alignment: Alignment.center,
                child: Text(
                  'I feel good today',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),*/
              Container(
                //Zweiter Runder Dunkel Grüner Hintergrund
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height / 1.3, 0, 0),
                height: MediaQuery.of(context).size.height / 3,
                child: ShapeOfView(
                  elevation: 10,
                  shape: ArcShape(
                    direction: ArcDirection.Outside,
                    position: ArcPosition.Top,
                    height: 20,
                  ),
                  child: Container(
                    color: Color(0xff266cbe),
                    //Color(0xFF0331a1)
                  ),
                ),
              ),
              Container(
                //Gesamt Chart
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.4,
                    MediaQuery.of(context).size.height / 2.1,
                    0,
                    0),
                child: getChart(ges, context, "/eingabeNav"),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  double y;
  final Color color;
}

class PassedData {
  PassedData({ges, food, mov, sleep});
  ChartData ges;
  ChartData food;
  ChartData mov;
  ChartData sleep;
}

InkWell getChart(List<ChartData> data, context, String route) {
  return InkWell(
    onTap: () => {Navigator.pushNamed(context, route)},
    child: SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Container(
              child:
                  /*Text(
              "${data[0].x}", //Write Text here
              style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 18),
            ),*/
                  Icon(getIcon(data[0].x))),
        ),
      ],
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          innerRadius: '80%',
          radius: '120%',
          pointColorMapper: (ChartData data, _) => data.color,
        ),
      ],
    ),
  );
}

IconData getIcon(String input) {
  switch (input.toUpperCase()) {
    case 'FOOD':
      return Icons.restaurant_menu;
    case 'MOVEMENT':
      return Icons.directions_run;
    case 'SLEEP':
      return Icons.nights_stay;
    case 'WELLBEING':
      return Icons.favorite;
    default:
      return Icons.error;
  }
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
