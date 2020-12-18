import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Statistics extends StatefulWidget {
  @override
  _Statistics createState() => _Statistics();
}

class _Statistics extends State<Statistics> {
  final Color chartColor = Colors.blue;
  final PassedData data = PassedData(
      chartData: ([
        ChartData('Test', 2, Colors.blue),
        ChartData('', 3, Colors.grey[200]),
      ]),
      barChartData: ([
        ChartData('Mo', 3),
        ChartData('Di', 4),
        ChartData('Mi', 1),
        ChartData('Do', 5),
        ChartData('Fr', 2),
        ChartData('Sa', 2),
        ChartData('So', 1),
      ]),
      title: 'Schlafen',
      star1: 15,
      star2: 2,
      star3: 4,
      star4: 6,
      star5: 20);

  int getEntries() {
    try {
      return data.star1 + data.star2 + data.star3 + data.star4 + data.star5;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "VitaChi", null),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SfCircularChart(
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                  widget: Container(
                    child: Text(
                      "${data.chartData[1].y}",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25),
                    ),
                  ),
                ),
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
                  child: AutoSizeText(
                    '${data.title}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Eingaben Gesamt:',
                      ),
                      AutoSizeText(
                        '1 Stern:',
                      ),
                      AutoSizeText(
                        '5 Sterne:',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      AutoSizeText('${getEntries()}'),
                      AutoSizeText('${data.star1}'),
                      AutoSizeText('${data.star5}'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: Container(
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 5.5,
                        isVisible: false,
                      ),
                      series: <ChartSeries<ChartData, String>>[
                        ColumnSeries<ChartData, String>(
                          dataSource: data.barChartData,
                          xValueMapper: (ChartData rating, _) => rating.x,
                          yValueMapper: (ChartData rating, _) => rating.y,
                          color: chartColor,
                        ),
                      ]),
                ),
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
  final double y;
  final Color color;
}

class PassedData {
  PassedData(
      {this.chartData,
      this.barChartData,
      this.title,
      this.star1,
      this.star2,
      this.star3,
      this.star4,
      this.star5});
  List<ChartData> chartData;
  List<ChartData> barChartData;
  String title;
  int star1;
  int star2;
  int star3;
  int star4;
  int star5;
}
