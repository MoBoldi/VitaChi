import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vitachi/entitys/Eingaben.dart';

class Essen extends StatefulWidget {
  @override
  _EssenState createState() => _EssenState();
}
final Color color = Color(0xFF3D6845);
class _EssenState extends State<Essen> {
  Eingaben essenEingaben = new Eingaben(0, 0);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBarEingaben(context, 'VitaChi', null),
      backgroundColor: Color(0xff82b086),
      body: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).size.height / 3.5, 0, 0),
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 1.5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: size.height/30),
                child: FittedBox(
                  child: Image(
                    image: AssetImage('assets/salad.png'),
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
                        child: AutoSizeText("Essen",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 50)),
                        flex: 1,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          "Bewerte hier auf einer Skala von 1 bis 5 Sternen deine letzte Mahlzeit!",
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
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(
                      "Wie gut hat dir deine letzte Mahlzeit geschmeckt?",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                    flex: 4,
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
                      essenEingaben.setEingabe1(rating);
                    },
                  ),
                  Expanded(
                    child: Container(),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(
                      "Wie gesund war deine letzte Mahlzeit?",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                    flex: 4,
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
                      essenEingaben.setEingabe2(rating);
                    },
                  ),
                  Expanded(
                    child: Container(),
                    flex: 2,
                  )
                ],
              ),
              flex: 10,
            ),
            Expanded(
              child: FlatButton(
                  onPressed: () {
                    print(essenEingaben.setAvg());
                    Navigator.pushReplacementNamed(context, '/',
                        arguments: {'avg': essenEingaben.setAvg()});
                  },
                  minWidth: MediaQuery.of(context).size.width / 1.25,
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
