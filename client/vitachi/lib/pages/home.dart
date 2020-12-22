import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';

class Home extends StatelessWidget {
  final List<ChartData> ges = [
    ChartData('Wellbeeing', 3, Colors.green),
    ChartData('', 2, Colors.green[100]),
  ];
  final List<ChartData> food = [
    ChartData('Food', 4, Colors.blue),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(context, 'VitaChi', null),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: AssetImage('assets/Blume_Placeholder.png'),
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
  final double y;
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
