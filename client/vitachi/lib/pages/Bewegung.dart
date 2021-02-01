import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

var eingaben = 0;
var sterne = 3.0;
class Bewegung extends StatefulWidget {
  @override
  _BewegungState createState() => _BewegungState();
}

class _BewegungState extends State<Bewegung> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color color = Color(0xFF3D6845);
    return Scaffold(
      appBar: MyAppBarEingaben(context, 'VitaChi', null),
      backgroundColor: Color(0xff82b086),
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height/4,0,0),
            height: MediaQuery.of(context).size.height/1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.white
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: AssetImage('assets/basketball-ball.png'),
                        width: size.width/3,
                    ),
                  ],
                ),
              Container(
                width: size.width/1.1,
                height: size.height/6,
                margin: EdgeInsets.only(top: size.height/8),
                child: Card(
                  color: Color(0xffc9f0cd),
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width/1.5,
                            child: AutoSizeText("Wie fühlst du dich nach deiner letzten Aktivität?",
                              style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
                              maxLines: 2,)
                          ),

                          Container(
                            width: size.width/2,
                            height: size.height/15,
                            child: FittedBox(
                              child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(
                                    horizontal: 0.2),
                                itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                onRatingUpdate: (rating) {

                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width/1.1,
                height: size.height/6,
                margin: EdgeInsets.only(top: size.height/20),
                child: Card(
                  color: Color(0xffc9f0cd),
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width/1.5,
                            child: AutoSizeText("Wie anstrengend war deine letzte Aktivität?",
                              style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
                              maxLines: 2,),
                          ),

                          Container(
                            width: size.width/2,
                            height: size.height/15,
                            child: FittedBox(
                              child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(
                                    horizontal: 0.2),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {

                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height/20),
                child: FlatButton(
                  onPressed: () {

                  },
                  minWidth: MediaQuery.of(context).size.width / 1.25,
                  height: size.height/15,
                  color: Color(0xFF3D6845),
                  child: AutoSizeText(
                    "Absenden",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(side: BorderSide(
                      color: color,
                      width: 1,
                      style: BorderStyle.solid
                  ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
            ],
          ),
        ]
        ),
      ),
    );
  }
}



