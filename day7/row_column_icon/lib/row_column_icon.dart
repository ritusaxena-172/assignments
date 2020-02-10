import 'dart:math';

import 'package:flutter/material.dart';

class RandomGenerate1{
static List<Color> colors = [
    Colors.amber,
    Colors.blue,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.grey,
    Colors.indigo,
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.greenAccent,
    Colors.amberAccent,
    Colors.blueGrey,
    Colors.deepOrangeAccent,
    Colors.yellow,
    Colors.grey,
    Colors.indigoAccent,
    Colors.lightBlue,
  ];
}


class RowColumnIcon extends StatefulWidget{
  @override
  _RowColumnIconState createState() => _RowColumnIconState();
}


class _RowColumnIconState extends State<RowColumnIcon> {
   var random=Random();
   var key0=0;
   var key1=1;
   var key2=2;
   var key3=3;
   var key4=4;
   var key5=5;
   var key6=6;
   var key7=7;
   var key8=8;
   var key9=9;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Scaffold(
        body:SafeArea(
                  child: Column(children: <Widget>[
            //1
            Expanded(
              flex: 4,
              child:Container(
                child:Row(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child:Column(children: <Widget>[
                        Expanded(flex: 1,
                        child: GestureDetector(
                          onTap: (){
                           setState(() {
                             key0=random.nextInt(18);
                           });
                          },
                          child: Container(
                          color:RandomGenerate1.colors[key0],
                          child:Icon(Icons.widgets, color: Colors.white),
                          height: 500,
                          width: 500,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                        ),)
                        ),
                        Expanded(flex: 1,
                        child: GestureDetector(
                          onTap: (){
                           setState(() {
                             key1=random.nextInt(18);
                           });
                          },child: Container(
                          child: Icon(Icons.send,color: Colors.white),
                           height: 500,
                          width: 500,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          color:RandomGenerate1.colors[key1],
                          )
                        ),),
                      ],)//
                    ),),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child:Column(children: <Widget>[
                        Expanded(flex: 1,
                        child: GestureDetector(
                          onTap: (){
                           setState(() {
                             key2=random.nextInt(18);
                           });
                          },
                        child:Container(
                          color: RandomGenerate1.colors[key2],
                          child: Icon(Icons.rate_review,color: Colors.white),
                          height: 500,
                          width: 500,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                        ))),
                        Expanded(flex: 3,child:Container(
                          child: Row(children: <Widget>[
                            Expanded(flex: 1, child: Container(
                              child: Column(children: <Widget>[
                                Expanded(flex: 3,
                                child: GestureDetector(
                                onTap: (){
                                 setState(() {
                                 key3=random.nextInt(18);
                                });
                                },
                                child:Container(
                                  color: RandomGenerate1.colors[key3],
                                  child: Icon(Icons.swap_calls,color: Colors.white),
                                  height: 500,
                                  width: 500,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                ))),
                                Expanded(flex: 1,
                                child: GestureDetector(
                                onTap: (){
                                setState(() {
                                 key4=random.nextInt(18);
                                 });
                                 },
                                child:Container(
                                  color: RandomGenerate1.colors[key4],
                                  child: Icon(Icons.wifi,color: Colors.white),
                                  height: 500,
                                  width: 500,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                ))
                              )],),
                            ),),
                            Expanded(flex: 1, child: Container(

                              child: Column(children: <Widget>[
                                Expanded(flex: 1,
                                child: GestureDetector(
                                onTap: (){
                                setState(() {
                                 key5=random.nextInt(18);
                                 });
                                 },
                                child:Container(
                                  color: RandomGenerate1.colors[key5],
                                  child: Icon(Icons.dashboard,color: Colors.white),
                                  height: 500,
                                  width: 500,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                ))),
                                Expanded(flex: 3,
                                child: GestureDetector(
                                 onTap: (){
                                 setState(() {
                                 key6=random.nextInt(18);
                                 });
                                 },
                                child:Container(
                                  color: RandomGenerate1.colors[key6],
                                  child: Icon(Icons.polymer,color: Colors.white),
                                  height: 500,
                                  width: 500,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                )))
                              ],),
                            ),),
                          ],),
                          )),
                      ],)
                    ),)
                ],)
              )),
            Expanded(
              flex:1,
              child:Container(
                  child: Row(children: <Widget>[
                  Expanded(flex: 3, 
                  child: GestureDetector(
                          onTap: (){
                           setState(() {
                             key7=random.nextInt(18);
                           });
                          },
                  child:Container(
                    color: RandomGenerate1.colors[key7],
                    child: Icon(Icons.battery_alert,color: Colors.white),
              height: 500,
              width: 500,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
                  ))),
                 Expanded(flex: 1, 
                    child: GestureDetector(
                          onTap: (){
                           setState(() {
                             key8=random.nextInt(18);
                           });
                          },
                 child:Container(
                    color: RandomGenerate1.colors[key8],
                    child: Icon(Icons.tv,color: Colors.white),
              height: 500,
              width: 500,
              padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                 ))),
                ],),
              )),
            Expanded(
              flex:1,
              child: GestureDetector(
                          onTap: (){
                           setState(() {
                             key9=random.nextInt(18);
                           });
                          },
            child:Container(
              color: RandomGenerate1.colors[key9],
              child: Icon(Icons.radio,color: Colors.white),
              height: 500,
              width: 500,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
            )))
          ],),
        )
      )
    );
  }
}