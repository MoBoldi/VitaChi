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
  Offset position = Offset(0, 0);
  bool Slot1Displayed = false;
  int Slot1ImageNumber = 1000;
  AssetImage Slot1ImagePfad;

  bool Slot2Displayed = false;
  int Slot2ImageNumber = 1000;
  String Slot2ImagePfad = "";

  bool Slot3Displayed = false;
  int Slot3ImageNumber = 1000;
  String Slot3ImagePfad = "";

  bool Slot4Displayed = false;
  int Slot4ImageNumber = 1000;
  String Slot4ImagePfad = "";

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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var products = List<Produkt>();

    Future<List<Produkt>> getData() async {
      Response response =
          await get('http://localhost:8080/vitaChi/findAll/Accessoire');
      print("response" + response.body);
      var productsJson = json.decode(response.body);
      for (var productJson in productsJson) {
        products.add(Produkt.fromJson(productJson));
      }
      //print(products[0].bildpfad);
      return productsJson;
    }

    return Scaffold(
        appBar: MyAppBarWohnzimmer(context, 'VitaChi', null),
        drawer: MyDrawer(),
        body: Stack(
          children: [
            Image(image: AssetImage("assets/tapete.png")),
            Container(
                height: height * 0.8,
                width: width,
                margin: EdgeInsets.only(top: height * 0.2),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/boden.jpg"),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Image(
                      width: MediaQuery.of(context).size.width * 0.75,
                      alignment: Alignment.center,
                      image: getEmotion(food[0].y),
                    ),
                    DragTarget<int>(builder: (
                      BuildContext context,
                      data,
                      rejected,
                    ) {
                      return Container(
                          width: 230,
                          margin: EdgeInsets.only(top: 0, left: 0),
                          height: 200,
                          decoration: BoxDecoration(
                            //border: Border.all(color: Colors.blueAccent),
                            color: Colors.black,
                          ),
                          child: Container(
                              width: 230,
                              height: 200,
                              child: Slot1Displayed
                                  ? Container(
                                      width: 230,
                                      height: 200,
                                      child: Image(
                                          image: Slot1ImagePfad,
                                          fit: BoxFit.fill))
                                  : Container(
                                      width: 230,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          //color: Colors.green,
                                          ))));
                    }, onWillAccept: (int data) {
                      print("HOVERED OVER DRAG TARGET1");
                      //Get Request ob der Slot bereits mit diesem Element belegt ist (IF) wenn nicht return true

                      if(Slot1ImageNumber == data ){
                        return false;
                      }else{return true;}
                    }, onAccept: (int data) async {
                      int slot1 = 1;
                      print("onAccept 1");
                      print("Dropped item NR  $data  on Slot $slot1");

                      setState(() {
                          Slot1Displayed = true;
                          Slot1ImageNumber = data;
                          Slot1ImagePfad =
                              AssetImage(products[Slot1ImageNumber].bildpfad);
                        },
                      );

                      // Response response = await post(url, headers: headers, body: json);

                      // einen post request mit dem Slot und der ID des Elements an Server schicken(data is die ID)
                      //funktion getData aufrufen um alle Slots mit den belegten Objekten zu bekommen und diese anzuzeigen
                    }),
                    DragTarget<int>(builder: (
                      BuildContext context,
                      data,
                      rejected,
                    ) {
                      return Container(
                          width: 230,
                          margin: EdgeInsets.only(top: 0, left: 230),
                          height: 200,
                          decoration: BoxDecoration(
                            //border: Border.all(color: Colors.red),
                            color: Colors.transparent,
                          ),
                          child: Container(
                              width: 230,
                              height: 200,
                              child: Slot2Displayed
                                  ? Container(
                                      width: 230,
                                      height: 200,
                                      child: Image(
                                          image: AssetImage(Slot2ImagePfad),
                                          fit: BoxFit.fill))
                                  : Container(
                                      width: 230,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          //color: Colors.green,
                                          ))));
                    }, onWillAccept: (int data) {
                      print("HOVERED OVER DRAG TARGET1");
                      //Get Request ob der Slot bereits mit diesem Element belegt ist (IF) wenn nicht return true

                      return true;
                    }, onAccept: (int data) {
                      int slot2 = 1;
                      print("onAccept 2");
                      print("Dropped item NR  $data  on Slot $slot2");

                      setState(() {
                        Slot2Displayed = true;
                        Slot2ImageNumber = data;
                        Slot2ImagePfad = products[Slot2ImageNumber].bildpfad;
                      });

                      // einen post request mit dem Slot und der ID des Elements an Server schicken(data is die ID)
                      //funktion getData aufrufen um alle Slots mit den belegten Objekten zu bekommen und diese anzuzeigen
                    }),
                    DragTarget<int>(builder: (
                      BuildContext context,
                      data,
                      rejected,
                    ) {
                      return Container(
                          width: 230,
                          margin: EdgeInsets.only(top: 200, left: 0),
                          height: 200,
                          decoration: BoxDecoration(
                            //border: Border.all(color: Colors.greenAccent),
                            color: Colors.transparent,
                          ),
                          child: Container(
                              width: 230,
                              height: 200,
                              child: Slot3Displayed
                                  ? Container(
                                      width: 230,
                                      height: 200,
                                      child: Image(
                                          image: AssetImage(Slot3ImagePfad),
                                          fit: BoxFit.fill))
                                  : Container(
                                      width: 230,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          //color: Colors.green,
                                          ))));
                    }, onWillAccept: (int data) {
                      print("HOVERED OVER DRAG TARGET1");
                      //Get Request ob der Slot bereits mit diesem Element belegt ist (IF) wenn nicht return true

                      return true;
                    }, onAccept: (int data) {
                      int slot3 = 1;
                      print("onAccept 1");
                      print("Dropped item NR  $data  on Slot $slot3");

                      setState(() {
                        Slot3Displayed = true;
                        Slot3ImageNumber = data;
                        Slot3ImagePfad = products[Slot3ImageNumber].bildpfad;
                      });

                      // einen post request mit dem Slot und der ID des Elements an Server schicken(data is die ID)
                      //funktion getData aufrufen um alle Slots mit den belegten Objekten zu bekommen und diese anzuzeigen
                    }),
                    DragTarget<int>(builder: (
                      BuildContext context,
                      data,
                      rejected,
                    ) {
                      return Container(
                          width: 230,
                          margin: EdgeInsets.only(top: 200, left: 230),
                          height: 200,
                          decoration: BoxDecoration(
                            //border: Border.all(color: Colors.blueAccent),
                            color: Colors.transparent,
                          ),
                          child: Container(
                              width: 230,
                              height: 200,
                              child: Slot4Displayed
                                  ? Container(
                                      width: 230,
                                      height: 200,
                                      child: Image(
                                          image: AssetImage(Slot4ImagePfad),
                                          fit: BoxFit.fill))
                                  : Container(
                                      width: 230,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          //color: Colors.green,
                                          ))));
                    }, onWillAccept: (int data) {
                      print("HOVERED OVER DRAG TARGET1");
                      //Get Request ob der Slot bereits mit diesem Element belegt ist (IF) wenn nicht return true

                      return true;
                    }, onAccept: (int data) {
                      int slot4 = 1;
                      print("onAccept 1");
                      print("Dropped item NR  $data  on Slot $slot4");

                      setState(() {
                        Slot4Displayed = true;
                        Slot4ImageNumber = data;
                        Slot4ImagePfad = products[Slot1ImageNumber].bildpfad;
                      });

                      // einen post request mit dem Slot und der ID des Elements an Server schicken(data is die ID)
                      //funktion getData aufrufen um alle Slots mit den belegten Objekten zu bekommen und diese anzuzeigen
                    }),
                    /*Container(
                      margin: EdgeInsets.only(top: 430, left: 270),
                      child: FlatButton(
                          onPressed: null,
                          color: Colors.white,
                          textColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.redAccent),
                          ),
                          hoverColor: Colors.red,
                          child: Text("Bearbeiten")),
                    ),*/

                    /*DragTarget<int>(builder: (
                      BuildContext context,
                      data,
                      rejected,
                    ) {
                      return Container(
                          width: 200,
                          margin: EdgeInsets.only(top: 0, left: 1),
                          height: 200,
                          color: Colors.transparent,
                          child: Container(
                            width: 200,
                            margin: EdgeInsets.only(top: 130),
                            height: 200,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red)),
                          ));
                    }, onWillAccept: (int data) {
                      print("HOVERED OVER DRAG TARGET2");
                      return true;
                    }, onAccept: (int data) {
                      int slot2 = 2;
                      print("onAccept 2");
                      print("Dropped item NR  $data  on Slot $slot2");

                      setState(() {
                        Slot1Displayed = true;
                      });
                      print(Slot1Displayed);
                    })*/
                  ],
                )),

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
            ,*/
            Stack(
              children: [
                Container(
                  height: height * 0.36,
                  width: width,
                  color: Colors.transparent,
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.3,
                  minChildSize: 0.3,
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
                                    height: 200,
                                    width: width,
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        LongPressDraggable<int>(
                                          data: index,
                                          child: Image(
                                            image: AssetImage(
                                              products[index].bildpfad,
                                            ),
                                            width: 150,
                                            height: 150,
                                          ),
                                          feedback: Image(
                                              image: AssetImage(
                                                  products[index].bildpfad),
                                              width: 150.0,
                                              height: 150.0),

                                          // onDraggableCanceled: ,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 60),
                                            child: Text(
                                              products[index].bezeichnung,
                                              style: TextStyle(fontSize: 30),
                                            )),
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return Image(
                                image: AssetImage('assets/LogoSlider.png'));
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
