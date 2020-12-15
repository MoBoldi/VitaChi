import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(context, 'VitaChi', null),
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
        drawer: MyDrawer());
  }
}
