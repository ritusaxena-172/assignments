import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/ownerscreen.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'PawSome!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),
        ),
        body: Column(children: <Widget>[
          Container(
              height: 240,
              width: 700,
              //  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              // child: Material(
              //     elevation: 9.0,

              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(7),
              //   bottomRight: Radius.circular(7),
              // )),
              // child: Padding(
              //     padding: EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Carousel(
                    images: [
                      AssetImage("assets/images/carosel1.jpg"),
                      AssetImage("assets/images/carosel2.jpg"),
                      AssetImage("assets/images/carosel3.jpg"),
                      AssetImage("assets/images/carousel4.jpeg"),
                      AssetImage("assets/images/carosel5.jpg"),
                    ],
                    autoplayDuration: Duration(
                      seconds: 3,
                    ),
                    animationDuration: Duration(
                      milliseconds: 800,
                    ),
                    dotSize: 4.0,
                    //  dotBgColor: Colors.white
                  ))),
          //)
          //)
          Container(
            height: 50,
            width: 390,
            child: Center(
                child: Text(
              '🐾 Choose your service.🐾',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontFamily: 'Florsn',
              ),
            )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes().buyerScreen);
            },
            child: Stack(
              children: <Widget>[
                Container(
                  //  padding: EdgeInsets.all(90),
                  margin: EdgeInsets.fromLTRB(10, 30, 80, 5),
                  height: 100,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/homescreen1.jpeg",
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'For Adoption',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Florsn',
                          )),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(10, 30, 80, 5),
                  height: 100,
                  width: 390,
                  color: Colors.green.withOpacity(0.6),
                  // child: Text('Adopt a pet'),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes().ownerScreen);
            },
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(80, 20, 10, 5),
                  height: 100,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/homescreen2.jpg",
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                          text: 'For Shelter',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Florsn',
                          )),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(80, 20, 10, 5),
                  height: 100,
                  width: 390,
                  color: Colors.pink.withOpacity(0.6),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 80, 5),
                  height: 100,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/homescreen3.jpg",
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'Services',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Florsn',
                          )),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(10, 20, 80, 5),
                  height: 100,
                  width: 390,
                  color: Colors.red.withOpacity(0.6),
                ),
              ],
            ),
          ),
        ]));
  }
}
