import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shape_of_view/shape/arc.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  final blue = Color(0xFF4DA8DA);
  final lightblue = Color(0xFF9dc6dd);
  var wellbeing = 0.0;
  var wellbeingSkala = 3;
  var essen = 0.0;
  var bewegung = 0.0;
  var schlafen = 0.0;
  var arbeit = 0.0;
  var urlgetStats = '';
  var url = "http://10.0.2.2:8080/vitaChi";

  final List<ChartData> ges = [
    ChartData('Wellbeing', 3, Color(0xFF4DA8DA)),
    ChartData('', 2, Color(0xFF9dc6dd)),
  ];
  List<ChartData> food = [
    ChartData('Food', 0, Color(0xFF4DA8DA)),
    ChartData('', 0.1, Color(0xFF9dc6dd)),
  ];
  final List<ChartData> movement = [
    ChartData('Movement', 0, Color(0xFF4DA8DA)),
    ChartData('', 0.1, Color(0xFF9dc6dd)),
  ];
  final List<ChartData> sleep = [
    ChartData('Sleep', 0, Color(0xFF4DA8DA)),
    ChartData('', 0.1, Color(0xFF9dc6dd)),
  ];
  final List<ChartData> work = [
    ChartData('Work', 0, Color(0xFF4DA8DA)),
    ChartData('', 0.1, Color(0xFF9dc6dd)),
  ];

  Map data = {};

  @override
  Widget build(BuildContext context) {

    Future getData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt("UserID");
      Response response = await get(url+'/getWohlbefinden/$id');
      wellbeing = double.parse(response.body);
    }

    Future getEssenAVG() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt("UserID");
      Response response = await get(url+'/getEssenAVG/$id');
      essen = double.parse(response.body);
      food[0].y = essen;
      food[1].y = 5 - essen;
    }

    Future getBewegungAVG() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt("UserID");
      Response response =
          await get(url+'/getBewegungAVG/$id');
      bewegung = double.parse(response.body);
      movement[0].y = bewegung;
      movement[1].y = 5 - bewegung;
    }

    Future getSchlafAVG() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt("UserID");
      Response response =
          await get(url+'/getSchlafAVG/$id');
      schlafen = double.parse(response.body);
      sleep[0].y = schlafen;
      sleep[1].y = 5 - schlafen;
    }

    Future getWorkingHours() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt("UserID");
      Response response =
      await get(url+'/getWokringPerWeek/$id');
      arbeit = double.parse(response.body);
      work[0].y = arbeit;
      work[1].y = 38.5-arbeit;
    }

    double chartWidth = MediaQuery.of(context).size.width / 5;
    double chartHeight = MediaQuery.of(context).size.width / 5;

    return Scaffold(
        //Color(0xff5bc7e3)
        appBar: MyAppBar(context, 'VitaChi', null),
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
                height: MediaQuery.of(context).size.height / 1.65,
                width: MediaQuery.of(context).size.width,
                child: ShapeOfView(
                  elevation: 10,
                  shape: ArcShape(
                    direction: ArcDirection.Outside,
                    position: ArcPosition.Bottom,
                    height: 20,
                  ),
                  child: Row(
                    children: [
                      FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) => Image(
                          width: MediaQuery.of(context).size.width * 0.75,
                          image: getEmotion(wellbeing),
                        ),
                      ),
                      FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) => Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Stack(
                            children: [
                              //Do not touch.
                              StepProgressIndicator(
                                direction: Axis.vertical,
                                totalSteps: 5,
                                currentStep: 0,
                                unselectedSize: 20,
                                selectedSize: 0,
                                roundedEdges: Radius.circular(10),
                                unselectedColor: Colors.grey,
                              ),
                              //Touch
                              StepProgressIndicator(
                                direction: Axis.vertical,
                                totalSteps: 5,
                                currentStep: 5 - getRating(wellbeing),
                                unselectedSize: 20,
                                selectedSize: 0,
                                roundedEdges: Radius.circular(10),
                                gradientColor: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.redAccent,
                                    Colors.yellow,
                                    Colors.green
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                //Zweiter Runder Hell Blauer Hintergrund
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height / 1.35, 0, 0),
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
              /*Container(
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
              ),*/
              FutureBuilder(
                future: getEssenAVG(),
                builder: (context, snapshot) => Container(
                  //Food chart
                  width: chartWidth,
                  height: chartHeight,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      MediaQuery.of(context).size.height / 1.425,
                      0,
                      0),
                  child: getChart(food, context, "/essen"),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              FutureBuilder(
                future: getBewegungAVG(),
                builder: (context, snapshot) => Container(
                  //Bewegung Chart
                  width: chartWidth,
                  height: chartHeight,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.285,
                      MediaQuery.of(context).size.height / 1.475,
                      0,
                      0),
                  child: getChart(movement, context, "/bewegung"),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              FutureBuilder(
                future: getSchlafAVG(),
                builder: (context, snapshot) => Container(
                  //Schlaf chart
                  width: chartWidth,
                  height: chartHeight,
                  margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.515,
                    MediaQuery.of(context).size.height / 1.475,
                    0,
                    0,
                  ),
                  child: getChart(sleep, context, "/schlafen"),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              FutureBuilder(
                future: getWorkingHours(),
                builder: (context, snapshot) => Container(
                  //Arbeit chart
                  width: chartWidth,
                  height: chartHeight,
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.75,
                    top: MediaQuery.of(context).size.height / 1.425,
                  ),
                  child: getChart(work, context, "/arbeit"),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: MyDrawer());
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  double y;
  final Color color;
}

class PassedData {
  PassedData({ges, food, mov, sleep, work});
  ChartData ges;
  ChartData food;
  ChartData mov;
  ChartData sleep;
  ChartData work;
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
    case 'WORK':
      return Icons.work;
    default:
      return Icons.error;
  }
}

int getRating(double wellbeing) {
  if (1 <= wellbeing && wellbeing < 2) {
    return 1;
  } else if (2 <= wellbeing && wellbeing < 3) {
    return 2;
  } else if (3 <= wellbeing && wellbeing < 4) {
    return 3;
  } else if (4 <= wellbeing && wellbeing < 4.5) {
    return 4;
  } else if (4.5 <= wellbeing && wellbeing <= 5) {
    return 5;
  } else {
    return 0;
  }
}

AssetImage getEmotion(double wellbeing) {
  if (1 <= wellbeing && wellbeing < 2) {
    return AssetImage('assets/5_traurig.gif');
  } else if (2 <= wellbeing && wellbeing < 3) {
    return AssetImage('assets/4_traurig.gif');
  } else if (3 <= wellbeing && wellbeing < 4) {
    return AssetImage('assets/Vitachi_Neutral.gif');
  } else if (4 <= wellbeing && wellbeing < 4.5) {
    return AssetImage('assets/2_glücklich.gif');
  } else if (4.5 <= wellbeing && wellbeing <= 5) {
    return AssetImage('assets/1_glücklich.gif');
  } else {
    return AssetImage('assets/Vitachi_Neutral.gif');
  }
}
