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
                width: size.width/3,
                  image: AssetImage('assets/basketball-ball.png')
              ),
              Container(
                margin: EdgeInsets.only(top: size.height/20),
                  child: Text("Bewegung", style: TextStyle(fontSize: size.width/12, fontWeight: FontWeight.bold), )
              ),
              Container(
                margin: EdgeInsets.only(top: size.height/10),
                width: size.width/1.3,
                height: size.height/2.6,
                decoration: new BoxDecoration(
                    color: color,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                      bottomLeft: const Radius.circular(40.0),
                      bottomRight: const Radius.circular(40.0),
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height/15,
                    ),
                    AutoSizeText("Wie fühlst du dich?", style: TextStyle(color: Colors.white, fontSize: 20),maxLines: 1,),
                    Container(
                      margin: EdgeInsets.only( bottom: size.height/20),
                      width: size.width/1.7,
                      child: Center(
                        child: RatingBar.builder(
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
                          },
                        ),
                      ),
                    ),
                    AutoSizeText("Wie anstrengend war's?", style: TextStyle(color: Colors.white, fontSize: 20),maxLines: 1,),
                    Container(
                      width: size.width/1.7,
                      child: Center(
                        child: RatingBar.builder(
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
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}



