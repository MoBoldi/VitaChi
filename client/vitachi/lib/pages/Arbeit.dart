import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';


class Arbeit extends StatefulWidget {
  @override
  _ArbeitState createState() => _ArbeitState();
}

class _ArbeitState extends State<Arbeit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'VitaChi', null),
      backgroundColor: Color(0xffF2E7FE),
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
                child: Image(
                  image: AssetImage('assets/laptop.png'),
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
              child: Container(),
              flex: 10,
            ),

            Expanded(
              child: FlatButton(
                  onPressed: () {},
                  minWidth: MediaQuery.of(context).size.width / 2,
                  color: Colors.purpleAccent,
                  child: AutoSizeText(
                    "Absenden",
                    style: TextStyle(fontSize: 15),
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
