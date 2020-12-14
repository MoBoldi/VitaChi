import 'package:flutter/material.dart';
import 'package:vitachi/main.dart';

class EingabenNav extends StatefulWidget {
  @override
  _EingabenNavState createState() => _EingabenNavState();
}

class _EingabenNavState extends State<EingabenNav> {
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
              decoration: BoxDecoration(

              ),

            ),
            ListTile(
              title: Text("Home", style: TextStyle(fontSize: 18),),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text("Eingaben", style: TextStyle(fontSize: 18),),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/eingabeNav');
              },
            ),
            ListTile(
              title: Text("Statistiken", style: TextStyle(fontSize: 18),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Freunde", style: TextStyle(fontSize: 18),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Shop", style: TextStyle(fontSize: 18),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("ToDo",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
              },

            )
          ],
        ),

      ),
      body: Column(
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
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Icon(
                    Icons.food_bank,
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
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Icon(
                    Icons.sports,
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
                ]
            ),
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
                ]
            ),
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
    );
  }
}

