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

/*Widget MyAppBarFreunde(BuildContext context, String title, dynamic otherData) {
  bool isSearching = false; //Boolean damit Suchleiste erscheint

  return AppBar(
    centerTitle: true,
    title: !isSearching ? Text("Freunde") : Text("suche deine Freunde"),
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              this.isSearching = !this.isSearching;
            });
          })
    ],
  );
}*/

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
                      "beendest du sie. Danach kannst du mit Absenden deine Arbeitszeit bestätigen und sie wird dir angerechnet."),
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
