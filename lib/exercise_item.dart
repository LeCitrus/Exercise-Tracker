import 'package:flutter/material.dart';

class ExerciseItem extends StatefulWidget{

  const ExerciseItem({super.key,
    this.id = '',
    this.name = '',
    this.amount = 0,
    required this.removeItem,
    required this.undoItem});

  final String name, id;
  final int amount;
  final RemoveCallback removeItem;
  final UndoCallback undoItem;

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {

  String name = '';
  int amount = 0;
  String nameVal = '';
  int amountVal = 0;

  @override
  /* initialize variables from object creation */
  void initState() {
    super.initState();
    name = widget.name;
    amount = widget.amount;
  }

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
          onTap: () {showDialog(context: context, builder: (context) {
            return AlertDialog(
                title: Text("Edit Item", style: TextStyle(color: Colors.black, fontSize: 25)),
                backgroundColor: Colors.grey[300],
                content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget> [
                      TextField(
                        controller: TextEditingController()..text = name,
                        onChanged: (value) {
                          setState(() {
                            nameVal = value;
                          });
                        },
                      ),
                      TextField(
                        controller: TextEditingController()..text = '$amount',
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            amountVal = int.parse(value);
                          });
                        },
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
                    onPressed: () {setState(() {
                      name = nameVal;
                      amount = amountVal;
                      Navigator.pop(context);
                      });
                    },
                    child: Text("Confirm"),)
                  ]
                );
              }
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey[700],
              border: Border.all(color: Colors.black),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [Text('$amount  ', style: TextStyle(
                  fontSize: 30,
                  wordSpacing: 20,
                  color: Colors.white,
                  fontFamily: 'Barlow'
                ),
              ),
              Text(name, style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Barlow',
                  color: Colors.white,
              ))]),
              FloatingActionButton(
                  onPressed: (() {
                    widget.removeItem(widget);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Deleted $name", textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16)),
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            widget.undoItem(widget);
                        },
                      ),
                    ));
                  }),
                  backgroundColor: Colors.red[300],

                  child: Icon(Icons.delete_outline),)
            ]
            ),
        )
      );
    }
}


/* Call back functions */
typedef RemoveCallback = void Function(ExerciseItem item);
typedef UndoCallback = void Function(ExerciseItem item);