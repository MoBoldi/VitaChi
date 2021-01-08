import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';

class Wellbeing extends StatefulWidget {
  @override
  _Wellbeing createState() => _Wellbeing();
}

class _Wellbeing extends State<Wellbeing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'VitaChi', null),
      drawer: MyDrawer(),
      body: SingleChildScrollView(child: null),
    );
  }
}
