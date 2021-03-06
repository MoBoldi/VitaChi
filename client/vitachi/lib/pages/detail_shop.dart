import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vitachi/entitys/BenutzerAccessoire.dart';
import 'package:vitachi/entitys/Produkt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailShop extends StatelessWidget {
  Produkt data;

  DetailShop({@required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BenutzerAccessoire benutzerAccessoire = new BenutzerAccessoire(1,1);
    return Scaffold(
        appBar: MyAppBarWhite(context, 'VitaChi', null),
        backgroundColor:  Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height/1,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height /2),
                      decoration: BoxDecoration(
                          color: Color(0xFF5db4ec),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(data.bildpfad), height: MediaQuery.of(context).size.height/3,),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 5
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(data.bezeichnung, style: TextStyle(fontSize: size.height/30, color: Colors.white, fontWeight: FontWeight.bold),),
                                Container(
                                    child: Row(
                                      children: [
                                        Text("${data.preis}", style: TextStyle(color: Colors.white, fontSize: size.width/20),),
                                        Icon(
                                          Icons.monetization_on_outlined,
                                          color: Colors.amberAccent,
                                        ),
                                      ],
                                    )
                                ),

                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 30
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: AutoSizeText(data.beschreibung,
                            style: TextStyle(fontSize: 20, color: Colors.white), maxLines: 4,),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 15
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                              //new
                              onPressed: () async {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                int id = prefs.getInt("UserID");
                                benutzerAccessoire.setUID(id);
                                benutzerAccessoire.setPID(data.id);
                                String url = 'http://10.0.2.2:8080/vitaChi/createBenutzerAccessoire';
                                Map<String, String> headers = {"Content-type": "application/json"};
                                String json = jsonEncode(<String, Object>{'BenutzerAccessoire': benutzerAccessoire});
                                Response response = await post(url, headers: headers, body: json);

                                String url2 = 'http://10.0.2.2:8080/vitaChi/updateCoins/$id';
                                Map<String, String> headers2 = {"Content-type": "application/json"};
                                String json2 = jsonEncode(<String, Object>{'userUpdateCoins': data.preis});
                                Response response2 = await put(url2, headers: headers2, body: json2);


                                if (response.statusCode == 200 && response2.statusCode == 200){
                                  Navigator.pushReplacementNamed(context, "/shop");
                                }


                              },
                              child: Text(
                                "Kaufen",
                                style: TextStyle(
                                  fontSize: size.width/20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              color: Color(0xff266cbe),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              minWidth: size.width/2.5,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}