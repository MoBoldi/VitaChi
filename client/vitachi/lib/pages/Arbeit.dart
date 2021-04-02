import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:vitachi/entitys/ArbeitClass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Arbeit extends StatefulWidget {
  @override
  _ArbeitState createState() => _ArbeitState();
}

class _ArbeitState extends State<Arbeit> {
  var timerStream;
  var timerSubscription;
  var hoursStr = '00';
  var minutesStr = '00';
  var secondsStr = '00';
  var start;
  var stop;
  var status;
  final Color color = Color(0xFF3D6845);
  ArbeitClass arbeit = new ArbeitClass(DateTime.now(), DateTime.now());

  Future<bool> getData() async {
    Response response = await get('http://10.0.2.2:8080/vitaChi/activeArbeit');
    print("response" + response.body);
    if(response.body=='true'){
      status = true;
    }else{
      status = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBarArbeiten(context, 'VitaChi', null),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getData(),
        // ignore: missing_return
        builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Container(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        width: size.height / 5,
                        image: AssetImage('assets/laptopneu.png')
                    ),
                    Container(
                        margin: EdgeInsets.only(top: size.height / 30),
                        child: Text("Arbeit", style: TextStyle(fontSize: size
                            .width / 12, fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height / 80),
                      child: Text("Bitte Verwalte hier deine Arbeitszeit",
                        style: TextStyle(
                            fontSize: size.width / 25
                        ),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(top: size.height / 9),
                            width: size.width / 1.3,
                            height: size.height / 2.7,
                            decoration: new BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff3f8ee9),
                                      Color(0xff5db4ec)
                                    ]),
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(40.0),
                                  topRight: const Radius.circular(40.0),
                                  bottomLeft: const Radius.circular(40.0),
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "$hoursStr:$minutesStr:$secondsStr",
                                  style: TextStyle(
                                      fontSize: size.width / 6,
                                      color: Colors.white
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: LiteRollingSwitch(
                                          value: status,
                                          textOn: "Start",
                                          textOff: "Stop",
                                          colorOn: Color(0xff82b086),
                                          colorOff: Color(0xFFB5475A),
                                          iconOn: Icons.play_arrow_outlined,
                                          iconOff: Icons.stop,
                                          onTap: () async {
                                            if (status == true) {
                                              start = DateTime.now().toLocal();
                                              arbeit.setStart(start);
                                              arbeit.setDauer(start);
                                              String url = 'http://10.0.2.2:8080/vitaChi/createArbeit';
                                              Map<String, String> headers = {
                                                "Content-type": "application/json"
                                              };
                                              String json = jsonEncode(
                                                  <String, Object>{
                                                    'arbeit': arbeit
                                                  });
                                              Response response = await post(
                                                  url, headers: headers,
                                                  body: json);
                                              print(response.statusCode);
                                            } else {
                                              stop = DateTime.now().toLocal();
                                              arbeit.setStart(stop);
                                              arbeit.setDauer(stop);
                                              String url = 'http://10.0.2.2:8080/vitaChi/updateArbeit';
                                              Map<String, String> headers = {
                                                "Content-type": "application/json"
                                              };
                                              String json = jsonEncode(
                                                  <String, Object>{
                                                    'arbeit': arbeit
                                                  });
                                              Response response = await put(
                                                  url, headers: headers,
                                                  body: json);
                                              print(response.statusCode);
                                            }
                                          },
                                          onChanged: (bool position) {
                                            print("The button is $position");
                                          },
                                        ),
                                        margin: EdgeInsets.only(
                                            bottom: size.height / 11),
                                      ),
                                    ]
                                ),
                                /*RaisedButton(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                                  onPressed: () async {
                                    /*timerStream = stopWatchStream();
                                    timerSubscription = timerStream.listen((int newTick) {
                                      setState(() {
                                        hoursStr = ((newTick / (60 * 60)) % 60)
                                            .floor()
                                            .toString()
                                            .padLeft(2, '0');
                                        minutesStr = ((newTick / 60) % 60)
                                            .floor()
                                            .toString()
                                            .padLeft(2, '0');
                                        secondsStr =
                                            (newTick % 60).floor().toString().padLeft(2, '0');
                                      });
                                    });*/

                                    start = DateTime.now().toLocal();
                                    arbeit.setStart(start);
                                    arbeit.setDauer(start);
                                    String url = 'http://10.0.2.2:8080/vitaChi/createArbeit';
                                    Map<String, String> headers = {"Content-type": "application/json"};
                                    String json = jsonEncode(<String, Object>{'arbeit': arbeit});
                                    Response response = await post(url, headers: headers, body: json);
                                    print(response.statusCode);


                                    /*SharedPreferences.setMockInitialValues({});
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString("start", arbeit.toStringStart(start));
                                    print(prefs.getString("start"));*/
                                  },
                                  color: Color(0xff82b086),
                                  child: Text(
                                    'START',
                                    style: TextStyle(
                                      fontSize: size.width/20,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width/15,
                                ),
                                RaisedButton(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                                  onPressed: () async {
                                    //timerSubscription.cancel();
                                    //timerStream = null;
                                    /*SharedPreferences prefs = await SharedPreferences.getInstance();
                                    start=prefs.getString("start");
                                    print(prefs.getString("start"));*/
                                    stop = DateTime.now().toLocal();
                                    arbeit.setStart(stop);
                                    arbeit.setDauer(stop);
                                    String url = 'http://10.0.2.2:8080/vitaChi/updateArbeit';
                                    Map<String, String> headers = {"Content-type": "application/json"};
                                    String json = jsonEncode(<String, Object>{'arbeit': arbeit});
                                    Response response = await put(url, headers: headers, body: json);
                                    print(response.statusCode);

                                  },
                                  color: Color(0xFFB5475A),
                                  child: Text(
                                    'STOP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width/20,
                                    ),
                                  ),
                                ),
                              ],
                            ),*/

                                /*
                            Alte Methode Absende Button
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: EdgeInsets.only(top: size.height/18),
                                height: size.height/20,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.0)
                                      )
                                  ),
                                  onPressed: () async {
                                    print(arbeit.toString());
                                    String url = 'http://10.0.2.2:8080/vitaChi/createArbeit';
                                    Map<String, String> headers = {"Content-type": "application/json"};
                                    String json = jsonEncode(<String, Object>{'arbeit': arbeit});
                                    print(json);
                                    Response response = await post(url, headers: headers, body: json);
                                    print(response.statusCode);
                                    Navigator.pushReplacementNamed(context, '/',);
                                  },
                                  color: Color(0xFFB5475A),
                                  child: Text(
                                    "Absenden",
                                    style: TextStyle(fontSize: size.width/30, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),*/
                              ],
                            ),

                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),


            );
          }
        }),
    );
  }
}

Stream<int> stopWatchStream() {
  StreamController<int> streamController;
  Timer timer;
  Duration timerInterval = Duration(seconds: 1);
  int counter = 0;

  void stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
      counter = 0;
      streamController.close();
    }
  }

  void tick(_) {
    counter++;
    streamController.add(counter);
  }

  void startTimer() {
    timer = Timer.periodic(timerInterval, tick);
  }

  streamController = StreamController<int>(
    onListen: startTimer,
    onCancel: stopTimer,
    onResume: startTimer,
    onPause: stopTimer,
  );

  return streamController.stream;
}