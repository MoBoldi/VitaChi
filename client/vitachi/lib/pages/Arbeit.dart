import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:auto_size_text/auto_size_text.dart';


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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color color =  Color(0xff28AA7D);
    return Scaffold(
      appBar: MyAppBarEingaben(context, 'VitaChi', null),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  width: size.height/4.5,
                  image: AssetImage('assets/laptop.png')
              ),
              Container(
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
                          color: color,
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
                                },
                                color: Color(0xff82b086),
                                child: Text(
                                  'START',
                                  style: TextStyle(
                                    fontSize: size.width/20,
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
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/');
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