import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vitachi/entitys/ArbeitClass.dart';


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
  final Color color = Color(0xFF3D6845);
  ArbeitClass arbeit = new ArbeitClass(DateTime.now(), DateTime.now());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color color =  Color(0xff28AA7D);
    return Scaffold(
      appBar: MyAppBarArbeiten(context, 'VitaChi', null),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  width: size.height/5,
                  image: AssetImage('assets/laptopneu.png')
              ),
              Container(
                  margin: EdgeInsets.only(top: size.height/30),
                  child: Text("Arbeit", style: TextStyle(fontSize: size.width/12, fontWeight: FontWeight.bold), )
              ),
              Container(
                margin: EdgeInsets.only(top: size.height/80),
                child: Text("Bitte Verwalte hier deine Arbeitszeit",
                  style: TextStyle(
                      fontSize: size.width/25
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: size.height/9),
                      width: size.width/1.3,
                      height: size.height/2.7,
                      decoration: new BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Color(0xff3f8ee9), Color(0xff5db4ec)]),
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
                              fontSize: size.width/6,
                              color: Colors.white
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RaisedButton(
                                padding:
                                EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                                onPressed: () {
                                  timerStream = stopWatchStream();
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
                                  });
                                  var start = DateTime.now();
                                  print(start);
                                  arbeit.setStart(start);

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
                                onPressed: () {
                                  timerSubscription.cancel();
                                  timerStream = null;
                                  var stop = DateTime.now();
                                  print(stop);
                                  arbeit.setStop(stop);
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
                          ),
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
                                  String url = 'http://10.0.2.2:8080/vitaChi/createEingabe';
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
                          ),
                        ],
                      ),

                    ),
                  ),

                ],
              ),

            ],
          ),
        ),


      ),
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