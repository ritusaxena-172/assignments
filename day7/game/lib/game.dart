import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Game extends StatefulWidget{
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  final Map<String,bool> score={};

  final Map choices={
    '🍎':Colors.red,
    '🍊':Colors.orange,
    '🍇':Colors.purple,
    '🥔':Colors.brown,
    '🍏':Colors.green,
    '🍋':Colors.yellow
  };

  int shuffle=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Score ${score.length}/6'),
        backgroundColor: Colors.grey[400]),
        floatingActionButton: FloatingActionButton(
          child:Icon(Icons.refresh),
        ),
      );

  }
}