import 'package:carousel_pro/carousel_pro.dart';
//import 'package:dbdummy/screens/homescreen.dart';
import 'package:dbdummy/screens/splashscreen.dart';
//import 'package:dbdummy/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

//carousel
class SplashScreen1 extends StatelessWidget {
  final Widget testBGCarousel = Container(
    child: Carousel(
      images: [
        AssetImage('assets/images/image1.jpeg'),
        AssetImage('assets/images/image2.jpeg'),
        AssetImage('assets/images/image3.jpeg'),
      ]
          .map((bgImg) => Image(
              image: bgImg, width: 1500.0, height: 1500.0, fit: BoxFit.cover))
          .toList(),
      autoplayDuration: const Duration(seconds: 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        new PageView(
          children: [testBGCarousel],
        ),
        new ListView(
          children: [
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
      ]),
    );
  }
}
