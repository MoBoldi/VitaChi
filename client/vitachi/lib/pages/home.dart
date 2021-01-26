import 'package:flutter/material.dart';
import 'package:shape_of_view/shape/arc.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';

class Home extends StatelessWidget {
  final List<ChartData> ges = [
    ChartData('Wellbeing', 3, Colors.green),
    ChartData('', 2, Colors.green[100]),
  ];
  List<ChartData> food = [
    ChartData('Food', 5, Colors.blue),
    ChartData('', 1, Colors.blue[100]),
  ];
  final List<ChartData> movement = [
    ChartData('Movement', 3, Colors.amber),
    ChartData('', 2, Colors.amber[100]),
  ];
  final List<ChartData> sleep = [
    ChartData('Sleep', 2, Colors.purple),
    ChartData('', 3, Colors.purple[100]),
  ];

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    if (data == null) {
      print('It is null');
      data = {
        'arg': food[0].y,
      };
    } else {
      print('It is not null');
      food[0].y = data['avg'];
      food[1].y = 5 - data['avg'];
    }
    print(data);

    return Scaffold(
        backgroundColor: Color(0xff82b086),
        appBar: MyAppBar(context, 'VitaChi', null),
        body: Container(
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
                    color: Color(0xFF3D6845),
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
              Container(
                //Food chart
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.1,
                    MediaQuery.of(context).size.height / 1.4,
                    0,
                    0),
                child: getChart(food, context, "/essen"),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Container(
                //Bewegung Chart
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.4,
                    MediaQuery.of(context).size.height / 1.45,
                    0,
                    0),
                child: getChart(movement, context, "/bewegung"),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Container(
                //Schlaf chart
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.7,
                  MediaQuery.of(context).size.height / 1.4,
                  0,
                  0,
                ),
                child: getChart(sleep, context, "/schlafen"),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
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
