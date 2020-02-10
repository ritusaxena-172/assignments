import 'package:flutter/material.dart';

class Prac extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body:Column(children: <Widget>[
          Expanded(flex: 1, child: Container(
            color: Colors.pink,
          )),
          Expanded(flex: 1, child: Container(
            color: Colors.purple,
          )),
          Expanded(flex: 1, child: Container(
            color: Colors.blue,
            
          )),
        ],)
      )
    );
  }
  
}