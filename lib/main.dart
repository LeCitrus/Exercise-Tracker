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
    setState(() {items.add(ExerciseItem(id: '${items.length}', name: name, amount: amount, removeItem: (String id) {
      setState(() {
        items.removeWhere((item) => item.id == id);
          });
        })
      )
      ;})
    ;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Exercise Tracker',
      style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Barlow')),
      centerTitle: true,
      backgroundColor: Colors.black26,

      ),
      body: ListView(children: <Widget>[...items]),
      floatingActionButton: FloatingActionButton(
      onPressed: (() {showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Add Item", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueGrey,
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
              hintStyle: TextStyle(color: Colors.white)
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
                  hintStyle: TextStyle(color: Colors.white),
              ),
            ),]),
          actions: [
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white54)),
              onPressed: () {
              Navigator.pop(context);
            }, child: Text("Cancel"),)
            ,
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white54)),
              onPressed: () {
              setState(() {
                addItem(nameValue, amountValue);
                Navigator.pop(context);
              });
            }, child: Text("Confirm"),)
          ]
        );

          }
        );
      }),
      backgroundColor: Colors.green,
      child: Icon(Icons.add),
      ),
    );
  }
}
