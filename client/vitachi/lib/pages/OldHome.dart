import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';

class Home extends StatelessWidget {
  final List<ChartData> ges = [
    ChartData('Wellbeeing', 3, Colors.green),
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
        appBar: MyAppBar(context, 'VitaChi', null),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: getEmotion(food[0].y),
                  ),
                ),
                Container(
                  //padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  //maxWidth: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                child: getChart(ges),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                child: getChart(food),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                child: getChart(movement),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                child: getChart(sleep),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
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

SfCircularChart getChart(List<ChartData> data) {
  return SfCircularChart(
    annotations: <CircularChartAnnotation>[
      CircularChartAnnotation(
        widget: Container(
          child: Text(
            "${data[0].x}", //Write Text here
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 18),
          ),
        ),
      ),
    ],
    series: <CircularSeries>[
      DoughnutSeries<ChartData, String>(
        dataSource: data,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        innerRadius: '80%',
        radius: '90%',
        pointColorMapper: (ChartData data, _) => data.color,
      ),
    ],
  );
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
