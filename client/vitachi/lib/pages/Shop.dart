import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vitachi/components/myDrawer.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'VitaChi', null),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            height: MediaQuery.of(context).size.height/20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText("525 ", style: TextStyle(fontSize: 20),),
                Icon(
                  Icons.monetization_on
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
