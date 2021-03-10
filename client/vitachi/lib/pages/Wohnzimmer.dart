import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Wohnzimmer extends StatefulWidget {
  @override
  _WohnzimmerState createState() => _WohnzimmerState();
}

class _WohnzimmerState extends State<Wohnzimmer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: MyAppBarWohnzimmer(context, 'VitaChi', null),
        drawer: MyDrawer(),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/floor.png"),
            fit: BoxFit.cover,
          )),
          child: Stack(
            children: [
              Container(
                height: height * 0.36,
                width: width,
                color: Colors.transparent,
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 0.6,
                builder: (BuildContext context, myScrollController) {
                  return Container(
                    child: ListView(
                      controller: myScrollController,
                      children: [
                        Container(
                          height: 200.0,
                          width: width,
                          color: Colors.red,
                        ),
                        Container(
                          height: 200.0,
                          width: width,
                          color: Colors.blue,
                        ),
                        Container(
                          height: 200.0,
                          width: width,
                          color: Colors.pink,
                        ),
                        Container(
                          height: 200.0,
                          width: width,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
