// import 'dart:html';

import 'package:flutter/material.dart';

class Images{
  static List<Image>image=[
    Image.asset('assets/images/friends.jpeg'),
    Image.asset('assets/images/got.jpeg'),
    Image.asset('assets/images/harryPotter.jpg'),
    Image.asset('assets/images/sherlock.jpg'),
  ];

}

class HomeReturns extends StatefulWidget{
  @override
  _HomeReturnsState createState() => _HomeReturnsState();
}

class _HomeReturnsState extends State<HomeReturns> {
  @override
  //final Title='Color Mania';
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Home(),
    );  
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var decoration;
  int _id,index;

void method(index){
  setState((){
    _id = index;
 });
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.indigo, title:Text('Tv/Movie Mania')),
        drawer: Drawer(
          child:  new ListView(
          children: new List.generate(4, ( index){
            return new ListTile(title: new Text("item#$index"),
            onTap:(){
              method(index);
            },
            );
          })

        ),
    ),
    body: Column(
      children: <Widget>[
        Container(child:AssetImage(Images.image[_id])),
      ],
 ),
    );
  }
}


