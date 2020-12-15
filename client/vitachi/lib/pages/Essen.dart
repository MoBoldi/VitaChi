import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Essen extends StatefulWidget {
  @override
  _EssenState createState() => _EssenState();
}

class _EssenState extends State<Essen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'VitaChi', null),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Icon(
                Icons.food_bank,
                size: 170,
              ),
              flex: 5,
            ),
            Expanded(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text("Essen",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                          "Bewerte hier auf einer Skala von 1 bis 5 Sternen deine letzte Mahlzeit.",
                          style: TextStyle(fontSize: 15)),
                    ),
                  ],
                ),
                margin: EdgeInsets.fromLTRB(30.0, 0, 30, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(0, 80, 0, 0)),
                    Text(
                      "Wie gut hat dir deine letzte Mahlzeit geschmeckt?",
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text("Wie gut hat dir deine letzte Mahlzeit geschmeckt?"),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    FlatButton(
                      color: Color.fromRGBO(242, 231, 254, 1.0),
                      onPressed: () {},
                      child: Text(
                        "Absenden",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              flex: 13,
            ),
          ],
        ),
      ),
    );
  }
}
