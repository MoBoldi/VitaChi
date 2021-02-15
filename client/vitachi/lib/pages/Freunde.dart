import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:vitachi/pages/FreundeBody.dart';

class Freunde extends StatefulWidget {
  @override
  _FreundeState createState() => _FreundeState();
}

class _FreundeState extends State<Freunde> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(context, 'VitaChi', null),
        drawer: MyDrawer(),
        body: Body());
  }
}
