import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:vitachi/pages/ShopBody.dart';

class Aufgabe extends StatefulWidget {
  @override
  _AufgabeState createState() => _AufgabeState();
}

class _AufgabeState extends State<Aufgabe> {
  List tasks = List();
  String input = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Vitachi', null),
      backgroundColor: Color(0xff82b086),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Aufgabe hinzufügen"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            tasks.add(input);
                          });

                          Navigator.of(context).pop();
                        },
                        child: Text("hinzufügen"))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(tasks[index]),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        }),
                  ),
                ));
          }),
    );
  }
}
