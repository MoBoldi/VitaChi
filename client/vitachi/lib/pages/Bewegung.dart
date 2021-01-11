import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Bewegung extends StatefulWidget {
  @override
  _BewegungState createState() => _BewegungState();
}

class _BewegungState extends State<Bewegung> {
  @override
  Widget build(BuildContext context) {
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
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image(
                    image: AssetImage('assets/basketball-ball.png'),
                  ),
                ),
              ),
              flex: 5,
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
                        child: AutoSizeText("Bewegung",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 50)),
                        flex: 1,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          "Bewerte hier auf einer Skala von 1 bis 5 Sternen deine letzte  Bewegung.",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(),
                    flex: 4,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      "Wie anstrengend war deine letze Bewegung?",
                      style: TextStyle(fontSize: 20),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    flex: 2,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 40),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      "Wie fühlst du dich nach der Bewegung?",
                      style: TextStyle(fontSize: 20),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    flex: 2,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 40),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Expanded(
                    child: Container(),
                    flex: 4,
                  )
                ],
              ),
              flex: 10,
            ),
            Expanded(
              child: FlatButton(
                  onPressed: () {},
                  minWidth: MediaQuery.of(context).size.width / 2,
                  color: Color(0xFF3D6845),
                  child: AutoSizeText(
                    "Absenden",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0))),
              flex: 1,
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
