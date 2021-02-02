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
        backgroundColor:  Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height/1.1,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height /3),
                      decoration: BoxDecoration(
                          color: Color(0xFFB5475A),
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
                            height: MediaQuery.of(context).size.height / 10
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
                              child: Text(data["first_name"] + " " + data["last_name"], style: TextStyle(fontSize: size.height/30, color: Colors.white, fontWeight: FontWeight.bold),),
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
                          child: AutoSizeText("Beschreibung:",
                            style: TextStyle(fontSize: 20, color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: AutoSizeText("öllöksajdfsajfölksdj lk sdfljsaklöfj kjs dfölja sflöj salkf saldjf klsaj fklsja klf jakls flsadkjfsdjf sadkl fsj df jsaldf jösaldj fölasdj fasjf ösldfj söl jfd",
                              style: TextStyle(fontSize: 20, color: Colors.white), maxLines: 4,),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20
                        ),
                        Row(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,2,0),
                                child: AutoSizeText("243", style: TextStyle(fontSize: 20, color: Colors.white),),
                              ),
                            ),
                            Icon(
                              Icons.monetization_on_outlined,
                              color: Colors.white,
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
                                  color: Color(0xffB58E62),
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
