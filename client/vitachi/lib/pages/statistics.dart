import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Statistics', null),
      body: Text('Hallo! Ich bin eine Statistik.'),
      drawer: MyDrawer(),
    );
  }
}
