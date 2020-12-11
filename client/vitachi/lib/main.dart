import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
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
        body: Container(
          child: Center(
            child: Column(
              children: [
                Text("this is VitaChi"),
                Text("next step is a slider"),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Eingaben", style: TextStyle(fontSize: 18),),
              onTap: (){
                Navigator.pop(context);
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
    );
  }
}
