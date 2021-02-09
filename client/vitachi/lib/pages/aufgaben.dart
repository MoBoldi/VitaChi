import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:vitachi/pages/Essen.dart';
import 'package:vitachi/pages/ShopBody.dart';
import 'package:intl/intl.dart';

class Aufgabe extends StatefulWidget {
  @override
  _AufgabeState createState() => _AufgabeState();
}

class _AufgabeState extends State<Aufgabe> {
  List tasks = List();
  String input = "";

  DateTime _dateTime;
  String formatedDate = "";

  @override
  void initState() {
    super.initState();
  }

  void SetDate(DateTime date) {
    _dateTime = date;
    formatedDate = DateFormat("yyyy-MM-dd").format(_dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Vitachi', null),
      backgroundColor: Colors.white,
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
                      child: Text("Datum auswählen"),
                      color: Color(0xFFB5475A),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2222))
                            .then((date) {
                          setState(() {
                            SetDate(date);
                          });
                        });
                      },
                    ),
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            String text = input + " | " + formatedDate;
                            tasks.add(text);
                          });
                          Navigator.of(context).pop();
                        },
                        color: Color(0xff266cbe),
                        child: Text("hinzufügen"))
                  ],
                );
              });
        },
        backgroundColor: Color(0xff266cbe),
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
                        icon: Icon(Icons.check),
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
