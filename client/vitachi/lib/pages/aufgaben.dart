import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:http/http.dart';
import 'package:vitachi/components/myAppBar.dart';
import 'package:vitachi/components/myDrawer.dart';
import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';

class Aufgabe extends StatefulWidget {
  @override
  _AufgabeState createState() => _AufgabeState();
}

class _AufgabeState extends State<Aufgabe> {
  List tasks = List();
  String input = "";
  final Color color = Color(0xff9DC88D);

  DateTime _dateTime;
  String formatedDate = "";

  @override
  void initState() {
    super.initState();
  }

  void SetDate(DateTime date) {
    _dateTime = date;
    formatedDate = DateFormat("dd.MM.yyyy").format(_dateTime);
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
                      child: Text(
                        "Datum",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xff266cbe),
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
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xff266cbe),
                          ),
                        ),
                        color: Colors.white,
                        child: Text("Ok"))
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
              child: Container(
                  //color: Color(0xff266cbe),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff54a2fc), Color(0xff6bc2fa)]),
                  ),
                  //elevation: 4,
                  margin: EdgeInsets.all(8),

                  //shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(8)),

                  child: ListTile(
                    title: Text(tasks[index],
                        style: TextStyle(color: Colors.white)),
                    trailing: Wrap(
                      spacing: 6,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                tasks.removeAt(index);
                              });
                            }),
                        IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              setState(() {
                                tasks.removeAt(index);
                              });
                            })
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
