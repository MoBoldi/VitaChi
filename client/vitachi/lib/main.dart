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
        ));
  }
}
