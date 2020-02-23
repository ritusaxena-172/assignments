import 'dart:async';

import 'package:dbdummy/login.dart';
import 'package:dbdummy/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Login_Screen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
            decoration: BoxDecoration(
                //color: Color(0xff162C06),
                gradient: LinearGradient(
          colors: [Color(0xff6084c8), Color(0xff872E79)],
        ))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.pets,
                size: 50.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
            ),
            Text(
              'PawSome',
              style: TextStyle(
                  color: Colors.blue[200],
                  fontFamily: 'Florsn',
                  fontSize: 35.0),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: SpinKitFadingCube(
                color: Colors.cyan,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
