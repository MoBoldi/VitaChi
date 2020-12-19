import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';

class EingabenNav extends StatefulWidget {
  @override
  _EingabenNavState createState() => _EingabenNavState();
}

class _EingabenNavState extends State<EingabenNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'VitaChi', null),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 120,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Icon(
                      Icons.fastfood_rounded,
                      size: 80,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Essen'),
                        Text('Hier eingeben zum Essen'),
                        FlatButton(
                          color: Colors.purpleAccent[100],
                          onPressed: () {
                            Navigator.pushNamed(context, '/essen');
                          },
                          child: Text('Hinzufügen'),
                        )
                      ],
                    ),
                    flex: 6,
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Icon(
                      Icons.sports_basketball,
                      size: 80,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Bewegung'),
                        Text('Bewerte hier deine letzte aktive Bewegung'),
                        FlatButton(
                          color: Colors.purpleAccent[100],
                          onPressed: () {
                            Navigator.pushNamed(context, '/bewegung');
                          },
                          child: Text('Hinzufügen'),
                        )
                      ],
                    ),
                    flex: 6,
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Icon(
                      Icons.bedtime,
                      size: 80,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Schlaf'),
                        Text('Bewerte hier deinen letzten Schlaf'),
                        FlatButton(
                          color: Colors.purpleAccent[100],
                          onPressed: () {
                            Navigator.pushNamed(context, '/schlafen');
                          },
                          child: Text('Hinzufügen'),
                        )
                      ],
                    ),
                    flex: 6,
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Icon(
                      Icons.work,
                      size: 80,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Arbeit'),
                        Text('Hier kannst du deine Arbeitszeit eingeben'),
                        FlatButton(
                          color: Colors.purpleAccent[100],
                          onPressed: () {
                            Navigator.pushNamed(context, '/arbeit');
                          },
                          child: Text('Hinzufügen'),
                        )
                      ],
                    ),
                    flex: 6,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
