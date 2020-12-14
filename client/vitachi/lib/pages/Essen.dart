import 'package:flutter/material.dart';

class Essen extends StatefulWidget {
  @override
  _EssenState createState() => _EssenState();
}

class _EssenState extends State<Essen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VitaChi"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: null,
          )
        ],
      ),
      drawer: Drawer(
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
                Navigator.pushReplacementNamed(context, '/home');
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
                Navigator.pushReplacementNamed(context, '/statistics');
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          

        ],
      ),
    );
  }
}
