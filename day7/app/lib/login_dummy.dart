import 'package:flutter/material.dart';

import 'login.dart';
class Login_Screen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Wanderlust.com'),
                backgroundColor:Colors.grey[700],
              ),
            backgroundColor: Colors.grey[200],
            body: Column(
      children: <Widget>[
        Container(
          child: Expanded(
            flex:1,
            child: Column(
          children: <Widget>[
            Expanded(
            flex:3,
            child: Container(
              child: Image.asset('assets/images/travels.jpg',
                  height: 200, width: 300),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(40, 50, 40, 40),
            ),),
            Expanded(
            flex:1,
            child:Container(
              child: Text('Wanderlust.com',
                style: TextStyle(
                  fontSize: 30.0,color: Colors.grey[700]
                )
              )
            ))
          ],
        )
        )),
        Login(),
        ]
            
            )
        
    );
  }
}
  
