import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';


Widget MyAppBar(BuildContext context, String title, dynamic otherData) {
  final size = MediaQuery.of(context).size;
  final url = "http://10.0.2.2:8080/vitaChi";
  var coins = "";

  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("UserID");
    Response response = await get(url+'/getCoins/$id');
    coins = response.body;
  }

  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    title: Text('$title'),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    actions: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(size.width/50,size.height/70,size.width/40,size.height/70),
        width: size.width/4,
        decoration: new BoxDecoration(
          color: Color(0xff5dacde),
          borderRadius: new BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) =>
                  Text(coins + " ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width/23,
                          fontWeight: FontWeight.bold)),),
            Icon(
              Icons.monetization_on_sharp,
              color: Colors.amberAccent,
            ),
          ],
        ),
      )
    ],
  );
}
