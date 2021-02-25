import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:vitachi/components/myDrawer.dart';

class Wohnzimmer extends StatefulWidget {
  @override
  _WohnzimmerState createState() => _WohnzimmerState();
}

class _WohnzimmerState extends State<Wohnzimmer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBarWohnzimmer(context, 'VitaChi', null),
      drawer: MyDrawer(),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/floor.jpg"),
                fit: BoxFit.fill
            ),

          ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Material(
                elevation: 15.0,
                child: Container(
                  height: size.height/2,
                  color: Color(0xFFf7eeda)
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
