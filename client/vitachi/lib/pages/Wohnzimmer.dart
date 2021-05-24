import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitachi/entitys/AccessoirePlatz.dart';
import 'package:vitachi/entitys/Produkt.dart';
import 'package:vitachi/pages/home.dart';
import 'package:shape_of_view/shape/arc.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
//import "package:json_object/json_object.dart";

class Wohnzimmer extends StatefulWidget {
  Map data = {};

  @override
  _WohnzimmerState createState() => _WohnzimmerState();
}

class _WohnzimmerState extends State<Wohnzimmer> {
  Offset position = Offset(0, 0);

  int userID = 2;
  bool Slot1Displayed = false;
  int Slot1ImageNumber;
  String Slot1ImagePfad;

  @override
  void initState() {
    super.initState();
    getSetAccessoire(userID);
  }

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

      //print(products[0].bildpfad);
      return productsJson;
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
                          width: 200,
                          margin: EdgeInsets.only(top: 5, left: 205),
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            color: Colors.transparent,
                          ),
                          child: Container(
                              width: 200,
                              height: 200,
                              child: Slot1Displayed
                                  ? Container(
                                  width: 200,
                                  height: 200,
                                  child: Image(
                                      image: AssetImage(Slot1ImagePfad),
                                      fit: BoxFit.fill))
                                  : Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    //color: Colors.green,
                                  ))));
                    }, onWillAccept: (int data) {
                      print("HOVERED OVER DRAG TARGET1");
                      //Get Request ob der Slot bereits mit diesem Element belegt ist (IF) wenn nicht return true

                      return true;
                    }, onAccept: (int data) {
                      int slot1 = 1;
                      print("onAccept 1");
                      print("Dropped item NR  $data  on Slot $slot1");

                      setState(() {
                        Slot1Displayed = true;
                        Slot1ImageNumber = data;
                        Slot1ImagePfad = products[Slot1ImageNumber].bildpfad;
                        postAccessoirePlatz(userID, Slot1ImageNumber, slot1);
                      });
                    }),
                    /*,
                         DragTarget<int>(
                        builder: (
                            BuildContext context,
                         data,
                        rejected,
              ) {
                return Container(
                    width: 120,
                 margin: EdgeInsets.only(top: 0, left: 300),
                    height: 200,
                    color: Colors.transparent,
                    child:Container(
                        width: 120,
                        margin: EdgeInsets.only(top: 130),
                         height: 70,
                       decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                    )

                );
              },
              onWillAccept: (int data) {
                    print("HOVERED OVER DRAG TARGET2");
                      return true;
              },
              onAccept: (int data) {
                int slot2 =2;
                print("onAccept 2");
                print("Dropped item NR  $data  on Slot $slot2");

                 setState(() {
                  Slot1Displayed = true;
                });
              print(Slot1Displayed);


              }
                      )*/
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
                                    height: 200.0,
                                    width: width,
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        LongPressDraggable<int>(
                                          data: index,
                                          child: Image(
                                              image: AssetImage(
                                                  products[index].bildpfad)),
                                          feedback: Image(
                                              image: AssetImage(
                                                  products[index].bildpfad),
                                              width: 200.0,
                                              height: 200.0),

                                          // onDraggableCanceled: ,
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

  void postAccessoirePlatz(int userID, int slot1ImageNumber, int slot1) async {
    String url = 'http://10.0.2.2:8080/vitaChi/createAccessoirePlatz';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(<String, Object>{'userID': userID, 'slot1ImageNumber': slot1ImageNumber, 'slot1': slot1});
    Response response = await post(url, headers: headers, body: json);

    getSetAccessoire(userID);
  }

  void getSetAccessoire(int userID) async {
    List<dynamic> accessoires;
    var products = List<Produkt>();

    Response response =
    await get('http://10.0.2.2:8080/vitaChi/findAll/Accessoire');
    print("response" + response.body);
    var productsJson = json.decode(response.body);
    for (var productJson in productsJson) {
      products.add(Produkt.fromJson(productJson));
    }

    String url = 'http://10.0.2.2:8080/vitaChi/getSetAccessoire/$userID';
    Map<String, String> headers = {"Content-type": "application/json"};
    response = await get(url, headers: headers);

    accessoires = jsonDecode(response.body);

    List<AccessoirePlatz> accessoirePlatzList = new List();

    for(var accessoire in accessoires) {
      accessoirePlatzList.add(AccessoirePlatz.fromJson(accessoire));
    }

    for (var accessoire in accessoirePlatzList) {
      if(accessoire.slot_it == 1) {
        Slot1ImageNumber = accessoire.accessoire_id;
      }
    }

    Slot1ImagePfad = products[Slot1ImageNumber].bildpfad;

    //Switch für mehrere Slots - Überprüfen von Slot jenachdem SlotImage dann 1, 2, 3 mit ID besetzen und Bildpfad erstellen
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
