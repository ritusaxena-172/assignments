import 'package:carousel_pro/carousel_pro.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/screens/aboutus.dart';
import 'package:dbdummy/screens/buyserscreen.dart';
import 'package:dbdummy/screens/ownerscreen.dart';
import 'package:dbdummy/screens/splashscreen.dart';
import 'package:dbdummy/services/sharedprefs_services.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String ksharedemail = '';
  @override
  void initState() {
    getPreference().then(updateName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
          centerTitle: true,
          title: Text(
            'PawSome!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration:boxDecoration,
          ),
        ),
        body: Container(
          child: Column(children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                  height: 300,
                  width: 700,
                  //  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Material(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7),
                    )),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
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
                  )),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Text('Adopt, don\'t shop!',
                        style: TextStyle(
                          fontSize: 40,
                          color: secondcolor,
                          fontStyle: FontStyle.italic,
                        )))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 120),
                    child: RaisedButton(
                      color: firstcolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(40.0),
                          side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OwnerPage()));
                      },
                      child: Text('Looking for adoption?'),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 120),
                    child: RaisedButton(
                      color: secondcolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(40.0),
                          side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BuyerScreen()));
                      },
                      child: Text('Looking for shelter?'),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: Text(ksharedemail),
              decoration: BoxDecoration(
                color: secondcolor,
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: firstcolor,
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Card(
                child: ListTile(
                    title: Text('About us'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => AboutUs()));
                    })),
            Card(
                child: ListTile(
                    title: Text('Log Out'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SplashScreen()));
                    }))
          ],
        )));
  }

//update name for shared preferences
  void updateName(String email) {
    setState(() {
      this.ksharedemail = email;
    });
  }
}
