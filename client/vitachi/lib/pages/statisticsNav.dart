import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';

class StatisticsNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Statistics', null),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _myCard('Wohlbefinden pro Monat', '/wellbeing', context),
              _myCard('Eingaben Schlaf', null, context),
              _myCard('Eingaben Essen', null, context),
              _myCard('Eingaben Bewegung', null, context),
              _myCard('Arbeitszeit', null, context),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

Widget _myCard(String text, String route, BuildContext context) {
  if (route == null) {
    route = '/statistics';
  }
  return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, '$route')},
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('$text', style: TextStyle(fontSize: 18))),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ));
}
