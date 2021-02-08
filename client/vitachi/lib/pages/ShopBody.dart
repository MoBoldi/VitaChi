import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/pages/detail_shop.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();

}


class _BodyState extends State<Body> {

  Map data;
  List userData;

  Future<dynamic> getData() async {
    Response response = await get('https://reqres.in/api/users?page=2');

    data = json.decode(response.body);

    userData = data["data"];
    print(userData.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "VitaShop",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GridView.builder(
                    itemCount: userData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.75),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //Navigator.pushNamed(context, '/detailShop');
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  DetailShop(data: userData[index])));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Color(0xff9DC88D),
                                        borderRadius: BorderRadius.circular(
                                            16)),
                                    child: Image(
                                      image: NetworkImage(
                                          userData[index]["avatar"]),
                                    )
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                userData[index]["first_name"],
                              ),
                            ),
                            Text(
                              "234€",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    });
              }else{
                return Image(image: AssetImage('assets/logo.png'));
              }
            }
          ),
        ))
      ],
    );
  }
}
/*
class ProduktKarte extends StatelessWidget {
  final Produkt produkt;

  ProduktKarte({Key key, this.produkt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(16)),
            child: FittedBox(
              child: Icon(
                Icons.laptop_chromebook,
                size: MediaQuery.of(context).size.height / 7,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              produkt.title,
            ),
          ),
          Text(
            "234€",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
*/


