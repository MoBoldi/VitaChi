import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:vitachi/entitys/AccessoirePlatz.dart';
import 'package:vitachi/entitys/Produkt.dart';
import 'package:vitachi/pages/home.dart';

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
  String Slot1ImagePfad = "";

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
    final size = MediaQuery.of(context).size;
    Future<List<Produkt>> getData() async {
      Response response =
          await get('http://10.0.2.2:8080/vitaChi/getBoughtAccessoire');
      var productsJson = json.decode(response.body);
      for (var productJson in productsJson) {
        products.add(Produkt.fromJson(productJson));
      }

      return productsJson;
    }

    /*data = ModalRoute.of(context).settings.arguments;
    if (data == null) {
      data = {
        'arg': food[0].y,

    }*/
    a

    return Scaffold(
        appBar: MyAppBarWohnzimmer(context, 'VitaChi', null),
        drawer: MyDrawer(),
        body: Stack(
          children: [
            Container(
                height: height * 0.75,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background1.jpg"),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 310, left: 5),
                        child: Image(
                          width: MediaQuery.of(context).size.width * 0.60,
                          alignment: Alignment.center,
                          image: getEmotion(food[0].y),
                        )),
                    DragTarget<int>(builder: (
                      BuildContext context,
                      data,
                      rejected,
                    ) {
                      return Container(
                          width: 200,
                          margin: EdgeInsets.only(top: 20, left: 25),
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.grey),
                            color: Colors.transparent,
                          ),
                          child: Container(
                              width: 200,
                              height: 200,
                              child: Container(
                                  width: 200,
                                  height: 200,
                                  child: Image(
                                      image: AssetImage(Slot1ImagePfad),
                                      fit: BoxFit.fill))));
                    }, onWillAccept: (int data) {
                      //Get Request ob der Slot bereits mit diesem Element belegt ist (IF) wenn nicht return true

                      return true;
                    }, onAccept: (int data) {
                      int slot1 = 1;

                      setState(() {
                        Slot1Displayed = true;
                        Slot1ImageNumber = data;
                        Slot1ImagePfad = products[Slot1ImageNumber].bildpfad;
                        postAccessoirePlatz(userID, Slot1ImageNumber, slot1);
                      });
                    }),
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
                DraggableScrollableSheet(
                  initialChildSize: 0.2,
                  minChildSize: 0.2,
                  maxChildSize: 0.2,
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
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: size.width / 8,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                    products[index].bildpfad),
                                                width: size.width / 3,
                                              ),
                                              SizedBox(
                                                width: size.width / 8,
                                              )
                                            ],
                                          ),
                                          feedback: Image(
                                              image: AssetImage(
                                                  products[index].bildpfad),
                                              width: size.width / 3),

                                          // onDraggableCanceled: ,
                                        ),
                                        Text(
                                          products[index].bezeichnung,
                                          style: TextStyle(
                                              fontSize: size.width / 20),
                                        ),
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
    String json = jsonEncode(<String, Object>{
      'userID': userID,
      'slot1ImageNumber': slot1ImageNumber,
      'slot1': slot1
    });
    Response response = await post(url, headers: headers, body: json);

    getSetAccessoire(userID);
  }

  void getSetAccessoire(int userID) async {
    List<dynamic> accessoires;
    var products = List<Produkt>();

    Response response =
        await get('http://10.0.2.2:8080/vitaChi/findAll/Accessoire');
    var productsJson = json.decode(response.body);
    for (var productJson in productsJson) {
      products.add(Produkt.fromJson(productJson));
    }

    String url = 'http://10.0.2.2:8080/vitaChi/getSetAccessoire/$userID';
    Map<String, String> headers = {"Content-type": "application/json"};
    response = await get(url, headers: headers);

    accessoires = jsonDecode(response.body);

    List<AccessoirePlatz> accessoirePlatzList = new List();

    for (var accessoire in accessoires) {
      accessoirePlatzList.add(AccessoirePlatz.fromJson(accessoire));
    }

    for (var accessoire in accessoirePlatzList) {
      if (accessoire.slot_it == 1) {
        Slot1ImageNumber = accessoire.accessoire_id;
      }
    }
    setState(() {
      Slot1ImagePfad = products[Slot1ImageNumber].bildpfad;
      print("pfad $Slot1ImagePfad");
    });

    //Switch für mehrere Slots - Überprüfen von Slot jenachdem SlotImage dann 1, 2, 3 mit ID besetzen und Bildpfad erstellen
  }
}

AssetImage getEmotion(double wellbeing) {
  if (1 <= wellbeing && wellbeing < 2) {
    return AssetImage('assets/5_traurig.gif');
  } else if (2 <= wellbeing && wellbeing < 3) {
    return AssetImage('assets/4_traurig.gif');
  } else if (3 <= wellbeing && wellbeing < 4) {
    return AssetImage('assets/Vitachi_Neutral.gif');
  } else if (4 <= wellbeing && wellbeing < 4.5) {
    return AssetImage('assets/2_glücklich.gif');
  } else if (4.5 <= wellbeing && wellbeing <= 5) {
    return AssetImage('assets/1_glücklich.gif');
  } else {
    return AssetImage('assets/Vitachi_Neutral.gif');
  }
}
