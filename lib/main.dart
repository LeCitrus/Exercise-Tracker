import 'package:flutter/material.dart';
import 'exercise_item.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Tracker',
        style: TextStyle(fontSize: 25, color: Colors.white,)),
        centerTitle: true,
        backgroundColor: Colors.black26,

      ),
      body: Row(children: <Widget> [Center(
        child: Text('hello ninjas!',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
            color: Colors.green,
            fontFamily: 'Barlow',
          ),
        ),
      ), ExerciseItem(),]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('addmer'),
        backgroundColor: Colors.black26,
      ),
    );
  }
}
