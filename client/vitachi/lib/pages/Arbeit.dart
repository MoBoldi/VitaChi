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
  var timestring="";
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
      }else if (response.body == 'false'){
        status = false;
      }else{
        status=true;
      }
  }

  Future<String> getWorkingTime() async {
    Response response = await get('http://10.0.2.2:8080/vitaChi/getWorkingTime');
    print("response" + response.body);
    if (response.body.startsWith("<!")){
    }else{
      timestring=response.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                            margin: EdgeInsets.only(top: size.height / 30),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      FutureBuilder(
                                          future: getData(),
                                          // ignore: missing_return, missing_return, missing_return
                                          builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.done) {
                                            return Container(
                                              child: LiteRollingSwitch(
                                                value: status,
                                                textOn: "Start",
                                                textOff: "Stop",
                                                colorOn: Color(0xff82b086),
                                                colorOff: Color(0xFFB5475A),
                                                iconOn: Icons
                                                    .play_arrow_outlined,
                                                iconOff: Icons.stop,
                                                onTap: () async {
                                                  if (status == true) {
                                                    start = DateTime.now()
                                                        .toLocal();
                                                    arbeit.setStart(start);
                                                    arbeit.setDauer(start);
                                                    String url = 'http://10.0.2.2:8080/vitaChi/createArbeit';
                                                    Map<String,
                                                        String> headers = {
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
                                                    await Future.delayed(Duration(seconds: 1));
                                                    Navigator.pushReplacementNamed(context, '/',);
                                                  } else {
                                                    stop = DateTime.now()
                                                        .toLocal();
                                                    arbeit.setStart(stop);
                                                    arbeit.setDauer(stop);
                                                    String url = 'http://10.0.2.2:8080/vitaChi/updateArbeit';
                                                    Map<String,
                                                        String> headers = {
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
                                                    Navigator.pushReplacementNamed(context, '/arbeit',);
                                                  }
                                                },
                                                onChanged: (bool position) {
                                                  print(
                                                      "The button is $position");
                                                },
                                              ),
                                              margin: EdgeInsets.only(top: size.height/15),
                                            );
                                          }else{
                                            return Image(image: AssetImage('assets/LogoSlider.png'));
                                          }
                                        }
                                      ),
                                    ]
                                ),

                                FutureBuilder(
                                  future: getWorkingTime(),
                                  // ignore: missing_return
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      return Container(
                                        child: Text(
                                          "$timestring",
                                          style: TextStyle(
                                            fontSize: size.width / 8,
                                            color: Colors.white,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(top: size.height/30),
                                      );
                                    }else{
                                      return Image(image: AssetImage('assets/LogoSlider.png'));
                                    }
                                  },
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

