import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/pages/detail_freunde.dart';

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
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Deine Freunde",
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
                              Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          DetailFreunde(data: userData[index])));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight,
                                                colors: [
                                                  Color(0xff54a2fc),
                                                  Color(0xff6bc2fa)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image(
                                              image: NetworkImage(
                                                  userData[index]["avatar"]),
                                            ),
                                            Text(
                                              userData[index]["first_name"],
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ))),
                              ],
                            ),
                          );
                        });
                  } else {
                    return Image(image: AssetImage('assets/logo.png'));
                  }
                }),
          ))
        ],
      ),
    );
  }
}
