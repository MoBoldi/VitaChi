import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vitachi/entitys/Eingaben.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

var eingaben = 0;
var sterne = 3.0;
class Bewegung extends StatefulWidget {
  @override
  _BewegungState createState() => _BewegungState();
}

class _BewegungState extends State<Bewegung> {
  Eingaben bewegungeingaben = new Eingaben(0, 0, "",0);
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
                height: size.height/4,
                  image: AssetImage('assets/laufen.png')
              ),
              Container(
                  margin: EdgeInsets.only(top: size.height/30),
                  child: Text("Bewegung", style: TextStyle(fontSize: size.width/12, fontWeight: FontWeight.bold), )
              ),
              Container(
                margin: EdgeInsets.only(top: size.height/80),
                child: Text("Bitte Bewerte deine letzte sportlich Bewegung",
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
                      margin: EdgeInsets.only(top: size.height/12),
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
                          Text("Wie fühlst du dich?", style: TextStyle(color: Colors.white, fontSize: size.width/20)),
                          Container(
                            margin: EdgeInsets.only( bottom: size.height/25),
                            width: size.width/1.7,
                            child: Center(
                              child: RatingBar.builder(
                                itemSize: size.width/10,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(
                                    horizontal: 0.3),
                                itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                onRatingUpdate: (rating) {
                                  bewegungeingaben.setEingabe1(rating);
                                },
                              ),
                            ),
                          ),
                          Text("Wie anstrengend war's?", style: TextStyle(color: Colors.white, fontSize: size.width/20)),
                          Container(
                            margin: EdgeInsets.only( bottom: size.height/45),
                            width: size.width/1.7,
                            child: Center(
                              child: RatingBar.builder(
                                itemSize: size.width/10,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(
                                    horizontal: 0.3),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  bewegungeingaben.setEingabe2(rating);
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: size.height/20,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0)
                                    )
                                ),
                                onPressed: () async {
                                  bewegungeingaben.setTyp("Bewegung");
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  int id = prefs.getInt("UserID");
                                  bewegungeingaben.setUserid(id);
                                  String url = 'http://10.0.2.2:8080/vitaChi/createEingabe';
                                  Map<String, String> headers = {"Content-type": "application/json"};
                                  String json = jsonEncode(<String, Object>{'eingabe': bewegungeingaben});
                                  Response response = await post(url, headers: headers, body: json);
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: size.height/24),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/CircleAvatar.png'),
                        radius: size.width/15,
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



