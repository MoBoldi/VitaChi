import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitachi/entitys/Produkt.dart';
import 'package:vitachi/pages/home.dart';
import 'package:shape_of_view/shape/arc.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Wohnzimmer extends StatefulWidget {
  final List<ChartData> ges = [
    ChartData('Wellbeing', 3, Color(0xFF4DA8DA)),
    ChartData('', 2, Color(0xFF9dc6dd)),
  ];
  List<ChartData> food = [
    ChartData('Food', 5, Color(0xFF4DA8DA)),
    ChartData('', 1, Color(0xFF9dc6dd)),
  ];
  final List<ChartData> movement = [
    ChartData('Movement', 3, Color(0xFF4DA8DA)),
    ChartData('', 2, Color(0xFF9dc6dd)),
  ];
  final List<ChartData> sleep = [
    ChartData('Sleep', 2, Color(0xFF4DA8DA)),
    ChartData('', 3, Color(0xFF9dc6dd)),
  ];
  final List<ChartData> work = [
    ChartData('Work', 30, Color(0xFF4DA8DA)),
    ChartData('', 20, Color(0xFF9dc6dd)),
  ];

  Map data = {};

  @override
  _WohnzimmerState createState() => _WohnzimmerState();
}

class _WohnzimmerState extends State<Wohnzimmer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var products = List<Produkt>();

    Future<List<Produkt>> getData() async {
      Response response =
          await get('http://10.0.2.2:8080/vitaChi/findAll/Accessoire');
      print("response" + response.body);
      var productsJson = json.decode(response.body);
      for (var productJson in productsJson) {
        products.add(Produkt.fromJson(productJson));
      }
      print(products[0].bildpfad);
    }

    /*data = ModalRoute.of(context).settings.arguments;
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
    print(data);*/

    return Scaffold(
        appBar: MyAppBarWohnzimmer(context, 'VitaChi', null),
        drawer: MyDrawer(),
        body: Stack(
          children: [
            DragTarget<String>(
              builder: (
                BuildContext context,
                data,
                rejected,
              ) {
                return Container(
                  child:
                      Image(image: AssetImage("assets/Blume_Placeholder.png")),
                  height: height * 0.8,
                  width: width,
                  margin: EdgeInsets.only(top: height * 0.2),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/boden.jpg"),
                          fit: BoxFit.fill)),
                );
              },
              onAccept: (String data) {
                setState(() {
                  return Image.asset('assets/test2.png');
                });
              },
            ),

            /* Container(
              /*child: Image(
                width: MediaQuery.of(context).size.width * 0.5,
                image: getEmotion(food[0].y),
              ),*/
              child: Image(image: AssetImage("assets/Blume_Placeholder.png")),
              height: height * 0.8,
              width: width,
              margin: EdgeInsets.only(top: height * 0.2),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/boden.jpg"), fit: BoxFit.fill)),
            ),*/
            Stack(
              children: [
                Container(
                  height: height * 0.36,
                  width: width,
                  color: Colors.transparent,
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.1,
                  minChildSize: 0.1,
                  maxChildSize: 0.3,
                  builder: (BuildContext context, myScrollController) {
                    return FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                                itemCount: products.length,
                                controller: myScrollController,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 200.0,
                                    width: width,
                                    color: Colors.red,
                                    child: Row(
                                      children: [
                                        Draggable(
                                          child: Image(
                                              image: AssetImage(
                                                  products[index].bildpfad)),
                                          feedback: Image(
                                              image: AssetImage(
                                                  products[index].bildpfad)),
                                          onDraggableCanceled: ,
                                        ),
                                        Text(products[index].bezeichnung),
                                      ],
                                    ),
                                  );
                                });
                          }
                        });
                    /*Container(
                      child: ListView(
                        controller: myScrollController,
                        children: [
                          Container(
                            height: 200.0,
                            width: width,
                            color: Colors.red,
                            child: Container(
                                alignment: Alignment.center,
                                width: width * 0.3,
                                height: 100.0,
                                color: Colors.white,
                                child: Draggable<String>(
                                  data: 'Item',
                                  child: Image.asset(
                                    'assets/test2.png',
                                    width: width * 0.3,
                                    height: 100.0,
                                  ),
                                  feedback: Image.asset(
                                    'assets/test2.png',
                                    width: width,
                                    height: height,
                                  ),
                                )),
                          ),
                          Container(
                            height: 200.0,
                            width: width,
                            color: Colors.blue,
                          ),
                          Container(
                            height: 200.0,
                            width: width,
                            color: Colors.pink,
                          ),
                          Container(
                            height: 200.0,
                            width: width,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    );*/
                  },
                ),
              ],
            ),
          ],
        ));
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
