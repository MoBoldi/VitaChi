import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Statistics extends StatefulWidget {
  @override
  _Statistics createState() => _Statistics();
}

class _Statistics extends State<Statistics> {
  final PassedData data = PassedData(
      ([
        ChartData('Test', 2, Colors.blue),
        ChartData('', 3, Colors.grey[200]),
      ]),
      'Schlafen');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "VitaChi", null),
      body: Column(
        children: [
          SfCircularChart(
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                  widget: Container(
                child: Text("${data.chartData[1].y}",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25)),
              )),
            ],
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                dataSource: data.chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                innerRadius: '80%',
                pointColorMapper: (ChartData data, _) => data.color,
              ),
            ],
          ),
          Card(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Center(
                  child: Text(
                    '${data.title}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}

class PassedData {
  PassedData(this.chartData, this.title);
  List<ChartData> chartData;
  String title;
}
