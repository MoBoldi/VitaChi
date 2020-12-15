import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/logo.png'),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(),
          ),
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: Text(
              "Eingaben",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/eingabeNav');
            },
          ),
          ListTile(
            title: Text(
              "Statistiken",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/statisticsNav');
            },
          ),
          ListTile(
            title: Text(
              "Freunde",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              "Shop",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              "ToDo",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
