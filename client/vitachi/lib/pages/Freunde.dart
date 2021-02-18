import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:vitachi/pages/FreundeBody.dart';

class Freunde extends StatefulWidget {
  @override
  _FreundeState createState() => _FreundeState();
}

class _FreundeState extends State<Freunde> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: !isSearching
              ? Text("Freunde")
              : TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: "Suche deine Freunde"),
                ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actions: <Widget>[
            isSearching
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    })
          ],
        ),
        drawer: MyDrawer(),
        body: Body());
  }
}
