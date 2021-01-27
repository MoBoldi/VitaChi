import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';

class EingabenNav extends StatefulWidget {
  @override
  _EingabenNavState createState() => _EingabenNavState();
}

class _EingabenNavState extends State<EingabenNav> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color color = Color(0xffbbedc5);
    return Scaffold(
      appBar: MyAppBar(context, 'VitaChi', null),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/essen');
              },
              child: Container(
                height: size.height/5.5,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image(
                        height: size.height/8,
                        image: AssetImage('assets/salad.png'),
                      ),
                    SizedBox(
                      width: size.width/10,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text('Essen', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold),
                              )
                          ),
                        ],
                    ),
                    SizedBox(
                      width: size.width/6,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              ),
                          width: size.width/4,
                          color: Color(0xffbbedc5),
                          height: size.height/5.5,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/bewegung');
              },
              child: Container(
                height: size.height/5.5,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image(
                      height: size.height/8,
                      image: AssetImage('assets/basketball-ball.png'),
                    ),
                    SizedBox(
                      width: size.width/13,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text('Bewegung', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold),
                            )
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width/13,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.arrow_forward_outlined,
                          ),
                          width: size.width/4,
                          color: Color(0xffbbedc5),
                          height: size.height/5.5,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/schlafen');
              },
              child: Container(
                height: size.height/5.5,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image(
                      height: size.height/8,
                      image: AssetImage('assets/night.png'),
                    ),
                    SizedBox(
                      width: size.width/10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text('Schlaf', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold),
                            )
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width/6,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.arrow_forward_outlined,
                          ),
                          width: size.width/4,
                          color: Color(0xffbbedc5),
                          height: size.height/5.5,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/arbeit');
              },
              child: Container(
                height: size.height/5.5,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image(
                      height: size.height/8,
                      image: AssetImage('assets/laptop.png'),
                    ),
                    SizedBox(
                      width: size.width/10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text('Arbeit', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold),
                            )
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width/6,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.arrow_forward_outlined,
                          ),
                          width: size.width/4,
                          color: Color(0xffbbedc5),
                          height: size.height/5.5,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
