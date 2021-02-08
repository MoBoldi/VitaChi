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
                        colors: [Color(0xff54a2fc), Color(0xff6bc2fa)]),
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
                        height: size.height/9,
                        image: AssetImage('assets/essen.png'),
                      ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text('Essen', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold, color: Colors.white),
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
                          width: size.width/5,
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
                        colors: [Color(0xff54a2fc), Color(0xff6bc2fa)]),
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
                      image: AssetImage('assets/basketball.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text('Bewegung', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold, color: Colors.white),
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
                          width: size.width/5,
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
                        colors: [Color(0xff54a2fc), Color(0xff6bc2fa)]),
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
                      image: AssetImage('assets/sleep.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text('Schlaf', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold, color: Colors.white),
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
                          width: size.width/5,
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
                        colors: [Color(0xff54a2fc), Color(0xff6bc2fa)]),
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
                      image: AssetImage('assets/laptop.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text('Arbeit', style: TextStyle(fontSize: size.width/17,fontWeight: FontWeight.bold, color: Colors.white),
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
                          width: size.width/5,
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
