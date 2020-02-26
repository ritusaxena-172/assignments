import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  bool enabletextfield = false;
  final TextEditingController sometext = new TextEditingController();
  List<String> todolist = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoList'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.change_history),
          onPressed: () {
            setState(() {
              enabletextfield = !enabletextfield;
            });
          }),
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
                controller: sometext,
                decoration: new InputDecoration(
                  fillColor: Colors.red,
                  enabled: enabletextfield,
                  hintText:
                      enabletextfield ? 'Add to the list' : 'You cannot add',
                ),
                onSubmitted: (text) {
                  todolist.add(text);
                  sometext.clear();
                  setState(() {});
                }),
          ),
          new Expanded(
              child: ListView.builder(
            padding: EdgeInsets.all(5),
            itemCount: todolist.length,
            itemBuilder: (BuildContext context, int index) {
              final item = todolist[index];
              return Dismissible(
                // Specify the direction to swipe and delete
                direction: DismissDirection.startToEnd,
                key: Key(item),
                onDismissed: (direction) {
                  // Removes that item the list on swipe
                  setState(() {
                    todolist.removeAt(index);
                  });

                  // Shows the information on Snackbar
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("$item is dismissed")));
                },
                background: Container(color: Colors.red),
                child: ListTile(title: Text('$item')),
              );
              //return new Text(todolist[index]);
            },
          ))
        ],
      ),
    );
  }
}
