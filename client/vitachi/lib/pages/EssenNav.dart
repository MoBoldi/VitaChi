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
    final Color color = Color(0xff9DC88D);
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
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff54a2fc), Color(0xff6bc2fa)]
                    ),
                    borderRadius: BorderRadius.circular(18),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                        height: size.height/8,
                        width: size.width/8,
                        image: AssetImage('assets/apfel.png'),
                      ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Center(
                                child: Text('Essen', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              )
                          ),
                        ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              ),
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
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff54a2fc), Color(0xff6bc2fa)]
                    ),
                    borderRadius: BorderRadius.circular(18),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                      height: size.height/10,
                      width: size.width/8,
                      image: AssetImage('assets/laufen.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Center(
                              child: Text('Bewegung', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            )
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                          ),
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
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff54a2fc), Color(0xff6bc2fa)]
                    ),
                    borderRadius: BorderRadius.circular(18),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                      height: size.height/8,
                      width: size.width/8,
                      image: AssetImage('assets/Bild_3.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                              child: Center(
                                child: Text('Schlaf', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                              )
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                          ),
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
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff54a2fc), Color(0xff6bc2fa)]
                    ),
                    borderRadius: BorderRadius.circular(18),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                      height: size.height/8,
                      width: size.width/8,
                      image: AssetImage('assets/laptopneu.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Center(
                              child: Text('Arbeit', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            )
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                          ),
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
