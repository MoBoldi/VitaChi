import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Statistics extends StatefulWidget {
  @override
  _Statistics createState() => _Statistics();
}

class _Statistics extends State<Statistics> {
  final Color chartColor = Color(0xFF4DA8DA); 
  
  int getEntries() {
    try {
      return getData().star1 + getData().star2 + getData().star3 + getData().star4 + getData().star5;
    } catch (e) {
      return 0;
    }
  }
  List<ChartData> cdata; 
  void changeChart(String clicked) {
    setState(() {switch (clicked.toUpperCase()) {
      case "WEEK": cdata = getData().barChartDataWeek; break;
      case "MONTH": cdata = getData().barChartDataMonth; break;
      case "YEAR": cdata = getData().barChartDataYear; break;
      default: cdata = getData().barChartDataWeek;
    }});
  }
  @override
  Widget build(BuildContext context) {
    
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
                  child: SfCircularChart(
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Container(
                          child: Text(
                            "${getData().chartData[1].y}",
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
                        dataSource: getData().chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        innerRadius: '80%',
                        radius: '80%',
                        pointColorMapper: (ChartData data, _) => data.color,
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff54a2fc), Color(0xff6bc2fa)],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Center(
                        child: AutoSizeText(
                          '${getData().title}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                          AutoSizeText('${getData().star1}'),
                          AutoSizeText('${getData().star5}'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: SfCartesianChart(
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
                        ),
                      ),
                      Center(
                        child: Wrap(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: (){
                                changeChart("WEEK");
                                print(cdata);
                              },
                              child: Text("Woche"),
                            ),
                            MaterialButton(
                              onPressed: (){
                                changeChart("Month");
                                print(cdata);
                              },
                              child: Text("Monat"),
                            ),
                            MaterialButton(
                              onPressed: (){
                                changeChart("YEAR");
                                print(cdata);
                              },
                              child: Text("Jahr"),
                            ),
                          ],
                        ),
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
class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}

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
