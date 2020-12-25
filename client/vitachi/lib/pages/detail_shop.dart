import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                      margin: EdgeInsets.only(top: size.height * 0.3),
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
                          child: Text("VitaShop", style: Theme.of(context).textTheme.headline6,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: NetworkImage(data["avatar"]), height: MediaQuery.of(context).size.height/7,),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20),
                        Row(
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
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 10
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                          child: AutoSizeText("Beschreibung:",
                            style: TextStyle(fontSize: 20),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: AutoSizeText("öllöksajdfsajfölksdj lk sdfljsaklöfj kjs dfölja sflöj salkf saldjf klsaj fklsja klf jakls flsadkjfsdjf sadkl fsj df jsaldf jösaldj fölasdj fasjf ösldfj söl jfd",
                            style: TextStyle(fontSize: 20), maxLines: 4,),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 10
                        ),
                        Row(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                child: AutoSizeText("243 VitaCoins", style: TextStyle(fontSize: 20),),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                child: FlatButton(onPressed: () {},
                                    child: Text(
                                      "Kaufen",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  color: Colors.purpleAccent[100],
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
