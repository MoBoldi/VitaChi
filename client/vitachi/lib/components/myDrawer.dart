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
              child: Center(
                child: Image(
                  image: AssetImage("assets/LogoSlider.png"),
                  height: MediaQuery.of(context).size.height / 8,
                ),
              ),
            ),
            decoration: BoxDecoration(),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.home),
                Text(
                  " Home",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.star),
                Text(
                  " Eingaben",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/eingabeNav');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.bar_chart),
                Text(
                  " Statistiken",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/statisticsNav');
            },
          ),
          /*ListTile(
            title: Row(
              children: [
                Icon(Icons.person_add),
                Text(
                  " Freunde",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/freunde');
            },
          ),*/
          ListTile(
            title: Row(
              children: [
                Icon(Icons.shopping_cart),
                Text(
                  " Shop",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/shop');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.menu_book),
                Text(
                  " ToDo",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/aufgaben');
            },
          ),
          /*ListTile(
            title: Row(
              children: [
                Icon(Icons.settings),
                Text(
                  " Settings",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),*/
          ListTile(
            title: Row(
              children: [
                Icon(Icons.event_seat),
                Text(
                  " Wohnzimmer",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/wohnzimmer');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.logout, color: Color(0xFFB5475A),),
                Text(
                  " Logout",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFB5475A),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
