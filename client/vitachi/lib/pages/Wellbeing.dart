import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'home.dart';

class Wellbeing extends StatefulWidget {
  @override
  _Wellbeing createState() => _Wellbeing();
}

class _Wellbeing extends State<Wellbeing> {
  final Color chartColor = Color(0xff3f8ee9);
  List<ChartData> cdata = [];
  final PassedData data = PassedData(
      chartData: ([
        ChartData('Test', 2, Color(0xff3f8ee9)),
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

  @override
  Widget build(BuildContext context) {
    Future getStats() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt("UserID");
      Response response =
          await get('http://10.0.2.2:8080/vitaChi/getWellbeingStats/$id');
      List<dynamic> statsJson = json.decode(response.body);
      List list = statsJson;
      cdata = [];
      for (var d in list) {
        ChartData c = new ChartData(d[1], d[0]);
        cdata.add(c);
      }
    }

    getStats();
    return Scaffold(
      //backgroundColor: Color(0xff82b086),
      appBar: MyAppBar(context, 'VitaChi', null),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.fromLTRB(15, 25, 15, 20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Center(
                  child: AutoSizeText(
                    'Wohlbefinden',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: FutureBuilder(
                future: getStats(),
                builder: (context, snapshot) {
                  return SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 5.5,
                      isVisible: false,
                    ),
                    series: <ChartSeries<ChartData, String>>[
                      ColumnSeries<ChartData, String>(
                        dataSource: cdata,
                        xValueMapper: (ChartData rating, _) => rating.x,
                        yValueMapper: (ChartData rating, _) => rating.y,
                        color: chartColor,
                      ),
                    ],
                  );
                },
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
