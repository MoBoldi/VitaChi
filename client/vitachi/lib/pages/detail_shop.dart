import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailShop extends StatelessWidget {
  Map data;
  DetailShop({@required this.data});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MyAppBar(context, 'VitaChi', null),
      backgroundColor: Color(0xffF2E7FE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height*0.3),
                    height: 900,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)
                      )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/14),
                            child: Image(image: NetworkImage(data["avatar"])))
                    ],
                  ),
                  Text(data["first_name"])
                ],
              ),
            )

          ],
        ),
      )

    );

  }
}
