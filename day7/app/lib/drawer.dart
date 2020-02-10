// import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var decoration;
  //
  int _id=0,index=0;
  //
 List<Image>image=[
    Image.asset('assets/images/friends.jpeg'),
    Image.asset('assets/images/got.jpeg'),
    Image.asset('assets/images/harryPotter.jpg'),
    Image.asset('assets/images/sherlock.jpg'),
  ];

  List<String> name=[
    'Friends',
    'Game Of Thrones',
    'Harry Potter',
    'Sherlock Holmes'
    ];
  //
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
            return new ListTile(title: new Text(name[index]),
            //
            onTap:(){
              method(index);
              Navigator.pop(context);
            },
            );
          })

        ),
    ),
    //
    body: Column(
      children: <Widget>[
        Container(
         child:image[_id],
         width: 500,
          ),
      ],
 ),
 
    );
  }
}


