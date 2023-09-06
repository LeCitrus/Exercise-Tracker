import 'package:flutter/material.dart';
import 'exercise_item.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<ExerciseItem> items = [];
  String nameValue = '';
  int amountValue = 0;

  void addItem(String name, int amount) {
    setState(() {items.add(
        ExerciseItem(
          id: '${items.length}',
          name: name,
          amount: amount,
          removeItem: (ExerciseItem item) {
            setState(() {
              items.remove(item);
            });
          },
          undoItem: (ExerciseItem item) {
            setState(() {
              items.insert(int.parse(item.id), item);
            });
          },
        ))
    ;})
  ;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Exercise Tracker',
        style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: 'Barlow')
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: ListView(children: <Widget>[...items]),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text("Add Item",
                style: TextStyle(color: Colors.black, fontSize: 25)
            ),
            backgroundColor: Colors.grey[300],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      nameValue = value;
                      });
                    },
                  decoration: InputDecoration(
                    hintText: "Enter exercise name",
                    hintStyle: TextStyle(color: Colors.grey)
                  ),
                ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    amountValue = int.parse(value);
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter amount done",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ]),
            actions: [
              TextButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white54)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white54)),
                onPressed: () {
                  setState(() {
                    addItem(nameValue, amountValue);
                      Navigator.pop(context);
                  });
                },
                child: Text("Confirm"),
              )
          ]
        );

          }
        );
      }),
      backgroundColor: Colors.green[800],
      child: Icon(Icons.add),
      ),
    );
  }
}
