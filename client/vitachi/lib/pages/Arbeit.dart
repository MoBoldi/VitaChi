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
    return Scaffold(
      appBar: MyAppBarEingaben(context, 'VitaChi', null),
      backgroundColor: Color(0xff82b086),
      body: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height/3.5,0,0),
          color: Colors.white,
          height: MediaQuery.of(context).size.height/1.5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: size.height/30),
                child: FittedBox(
                  child: Image(
                    image: AssetImage('assets/laptop.png'),
                  ),
                ),
              ),
              flex: 6,
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: AutoSizeText("Arbeiten",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 50)),
                        flex: 1,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          "Du kannst hier deine Arbeitszeit verwalten um gerecht dafür belohnt zu werden.",
                          style: TextStyle(fontSize: 23),
                          maxLines: 2,
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
                margin: EdgeInsets.fromLTRB(30.0, 0, 30, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$hoursStr:$minutesStr:$secondsStr",
                      style: TextStyle(
                        fontSize: 90.0,
                      ),
                    ),
                    SizedBox(height: 30.0),
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
                          color: Colors.green,
                          child: Text(
                            'START',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 40.0),
                        RaisedButton(
                          padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                          onPressed: () {
                            timerSubscription.cancel();
                            timerStream = null;
                          },
                          color: Colors.red,
                          child: Text(
                            'STOP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              flex: 10,
            ),

            Expanded(
              child: FlatButton(
                  onPressed: () {},
                  minWidth: MediaQuery.of(context).size.width / 1.25,
                  color: Color(0xFF3D6845),
                  child: AutoSizeText(
                    "Absenden",
                    style: TextStyle(fontSize: 15,  color: Colors.white),
                  ),
                shape: RoundedRectangleBorder(side: BorderSide(
                    color: color,
                    width: 1,
                    style: BorderStyle.solid
                ),
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(),
              flex: 2,
            ),
          ],
        ),
      ]),
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