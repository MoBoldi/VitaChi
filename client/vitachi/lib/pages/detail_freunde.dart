import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailFreunde extends StatelessWidget {
  Map data;

  DetailFreunde({@required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: MyAppBarWhite(context, 'VitaChi', null),
        backgroundColor: Colors.white,
        body: SingleChildScrollView());
  }
}
