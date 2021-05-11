import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vitachi/entitys/Eingaben.dart';
import 'dart:convert';

class Statistics extends StatefulWidget {
  final String type;
  const Statistics(this.type);
  @override
  _Statistics createState() => _Statistics();
}

class _Statistics extends State<Statistics> {
  final Color chartColor = Color(0xFF4DA8DA);
  var entries = [];
  var stats = [0, 0];
  List<ChartData> cdata = [];
  List<ChartData> avg = [
    ChartData('', 0, Color(0xFF4DA8DA)),
    ChartData('', 5, Color(0xFF9dc6dd)),
  ];

  getChartData() {
    var i = 1;
    for (var entry in entries) {
      print(entry);
      ChartData c =
          new ChartData(i.toString(), entry.eingabe1 + entry.eingabe2);
      cdata.add(c);
      i++;
    }
    print("------------- cdata --------------");
    print(cdata);
  }

  @override
  Widget build(BuildContext context) {
    Future getDBData() async {
      Response response = await get(
          'http://10.0.2.2:8080/vitaChi/findInputByType/' + widget.type);
      var entriesJson = json.decode(response.body);
      entries = [];
      cdata = [];
      for (var entry in entriesJson) {
        entries.add(Eingaben.fromJson(entry));
      }
      getChartData();
    }

    Future getAvgData() async {
      Response response =
          await get('http://10.0.2.2:8080/vitaChi/get' + widget.type + 'AVG');
      print('--------------- AVG ----------------');
      print(response.body);
      avg = [
        ChartData('', 0, Color(0xFF4DA8DA)),
        ChartData('', 5, Color(0xFF9dc6dd)),
      ];
      avg[0].x = widget.type;
      avg[0].y = double.parse(response.body);
      avg[1].y = 5 - avg[0].y;
      print(avg);
    }

    Future getStats() async {
      Response response =
          await get('http://10.0.2.2:8080/vitaChi/getStats/' + widget.type);
      List<dynamic> statsJson = json.decode(response.body);
      print('------------ StatsJson ------------');
      print(statsJson);
      List list = statsJson;
      int star1 = int.parse(list.elementAt(0).toString());
      int star5 = int.parse(list.elementAt(1).toString());
      int ges = int.parse(list.elementAt(2).toString());
      stats = [];
      stats.add(star1);
      stats.add(star5);
      stats.add(ges);
      print('---------------- Stats ------------------');
      print(stats);
    }

    return Scaffold(
      appBar: MyAppBar(context, "VitaChi", null),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  0, /*MediaQuery.of(context).size.height / 3*/ 0, 0, 0),
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 3,
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: FutureBuilder(
                      future: getAvgData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return SfCircularChart(
                            annotations: <CircularChartAnnotation>[
                              CircularChartAnnotation(
                                widget: Container(
                                  child: Text(
                                    avg[0].x,
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            series: <CircularSeries>[
                              DoughnutSeries<ChartData, String>(
                                dataSource: avg,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                innerRadius: '80%',
                                radius: '80%',
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                              ),
                            ],
                          );
                        } else {
                          return Image(
                              image: AssetImage('assets/LogoSlider.png'));
                        }
                      }),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Bewertungen Gesamt:',
                          ),
                          AutoSizeText(
                            '1 Stern:',
                          ),
                          AutoSizeText(
                            '5 Sterne:',
                          ),
                        ],
                      ),
                      FutureBuilder(
                        future: getStats(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              children: [
                                AutoSizeText('${stats[2]}'),
                                AutoSizeText('${stats[0]}'),
                                AutoSizeText('${stats[1]}'),
                              ],
                            );
                          } else {
                            return Image(
                                image: AssetImage('assets/LogoSlider.png'));
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: FutureBuilder(
                            future: getDBData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
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
                                      xValueMapper: (ChartData rating, _) =>
                                          rating.x,
                                      yValueMapper: (ChartData rating, _) =>
                                          rating.y,
                                      color: chartColor,
                                    ),
                                  ],
                                );
                              } else {
                                return Image(
                                    image: AssetImage('assets/LogoSlider.png'));
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
PassedData getData() {
  return PassedData(
      chartData: ([
        ChartData('Test', 2, Color(0xFF4DA8DA)),
        ChartData('', 3, Color(0xFF9dc6dd)),
      ]),
      barChartDataWeek: ([
        ChartData('Mo', 3),
        ChartData('Di', 4),
        ChartData('Mi', 1),
        ChartData('Do', 5),
        ChartData('Fr', 2),
        ChartData('Sa', 2),
        ChartData('So', 1),
      ]),
      barChartDataMonth: ([
        ChartData('Woche 1', 4),
        ChartData('Woche 2', 4),
        ChartData('Woche 3', 1),
        ChartData('Woche 4', 5),
      ]),
      barChartDataYear: ([
        ChartData('1', 3),
        ChartData('2', 4),
        ChartData('3', 1),
        ChartData('4', 5),
        ChartData('5', 2),
        ChartData('6', 2),
        ChartData('7', 1),
        ChartData('8', 3),
        ChartData('9', 4),
        ChartData('10', 1),
        ChartData('11', 5),
        ChartData('12', 2),
      ]),
      title: 'Schlafen',
      star1: 15,
      star2: 2,
      star3: 4,
      star4: 6,
      star5: 20);
}
*/
class ChartData {
  ChartData(this.x, this.y, [this.color]);
  String x;
  double y;
  Color color;
}
/*
class PassedData {
  PassedData(
      {this.chartData,
      this.barChartDataWeek,
      this.barChartDataMonth,
      this.barChartDataYear,
      this.title,
      this.star1,
      this.star2,
      this.star3,
      this.star4,
      this.star5});
  List<ChartData> chartData;
  List<ChartData> barChartDataWeek;
  List<ChartData> barChartDataMonth;
  List<ChartData> barChartDataYear;
  String title;
  int star1;
  int star2;
  int star3;
  int star4;
  int star5;
}
*/