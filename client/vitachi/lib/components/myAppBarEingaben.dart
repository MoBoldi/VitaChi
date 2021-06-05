import 'package:flutter/material.dart';

Widget MyAppBarEingaben(BuildContext context, String title, dynamic otherData) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.info_outline, color: Colors.black),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => new AlertDialog(
              title: const Text('Deine Eingaben'),
              content: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "Auf dieser Seite kannst du auf einer Skala von 1 bis 5 (Sternen) deine letze Mahlzeit/Aktivität oder deinen letzten Schlaf bewerten."),
                ],
              ),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        },
      )
    ],
  );
}

Widget MyAppBarWhite(BuildContext context, String title, dynamic otherData) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    actions: <Widget>[],
  );
}

Widget MyAppBarWohnzimmer(BuildContext context, String title, dynamic otherData) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Color(0xFFFFFFFF),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    actions: <Widget>[],
  );

}

Widget MyAppBarArbeiten(BuildContext context, String title, dynamic otherData) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.info_outline, color: Colors.black),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => new AlertDialog(
              title: const Text('Deine Eingaben'),
              content: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "Auf dieser Seite kannst du mithilfe des Timers deine Arbeitszeit verwalten. Mit den Start Knopf startest du die Arbeit und mit Stopp "
                      "beendest du sie. Danach kannst du mit Absenden deine Arbeitszeit bestätigen und du bekommst pro gearbeitete Minute einen Coin. "
                          "Im Shop werden nur jene Items angezeigt die du dir leisten kannst."),
                ],
              ),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        },
      )
    ],
  );
}
