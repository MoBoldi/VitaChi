import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vitachi/components/myAppBarEingaben.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailShop extends StatelessWidget {
  Map data;

  DetailShop({@required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: MyAppBarEingaben(context, 'VitaChi', null),
        backgroundColor:  Color(0xff82b086),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height /2.5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          //child: Text("VitaShop", style: Theme.of(context).textTheme.headline6,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: NetworkImage(data["avatar"]), height: MediaQuery.of(context).size.height/4,),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 7
                        ),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(40,0,40,0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height/10,
                                  child: Card(
                                    child: Center(
                                        child: Text(
                                          data["first_name"], style: Theme.of(context).textTheme.headline5,
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              flex: 3,
                            ),
                          ],
                        ),*/
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(data["first_name"] + " " + data["last_name"], style: TextStyle(fontSize: size.height/30),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text("klein gedruckte Zusatzinfo", style: TextStyle(color: Color(0xFF3D6845))),
                            ),

                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: AutoSizeText("Beschreibung:",
                            style: TextStyle(fontSize: 20),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: AutoSizeText("öllöksajdfsajfölksdj lk sdfljsaklöfj kjs dfölja sflöj salkf saldjf klsaj fklsja klf jakls flsadkjfsdjf sadkl fsj df jsaldf jösaldj fölasdj fasjf ösldfj söl jfd",
                              style: TextStyle(fontSize: 20), maxLines: 4,),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20
                        ),
                        Row(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,2,0),
                                child: AutoSizeText("243", style: TextStyle(fontSize: 20),),
                              ),
                            ),
                            Icon(
                              Icons.monetization_on_outlined
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                child: FlatButton(onPressed: () {},
                                    child: Text(
                                      "Kaufen",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                    ),
                                  color: Color(0xFF3D6845),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)
                                  ),
                                ),
                              ),
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
