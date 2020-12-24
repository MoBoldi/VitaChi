import 'package:flutter/material.dart';

class DetailShop extends StatelessWidget {
  Map data;
  DetailShop({@required this.data});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Text(data["first_name"]),

    );

  }
}
