import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/login_components.dart';
import 'package:dbdummy/screens/aboutus.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:flutter/material.dart';

import 'accounts.dart';

//import '../aboutus.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '';
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
            //borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
          ),
          centerTitle: true,
          title: Text(
            'PawSome!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [firstcolor, secondcolor],
                  end: Alignment.bottomRight),
            ),
          ),
        ),
        body: Column(children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Container(
                height: 300,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                              AssetImage("assets/images/download.jpeg"),
                              AssetImage("assets/images/images (1).jpeg"),
                              AssetImage("assets/images/images (2).jpeg"),
                              AssetImage("assets/images/images.jpeg"),
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
        ]),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: Text(email),
              decoration: BoxDecoration(
                color: Colors.yellow[700],
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.brown,
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Card(
              child: ListTile(
                  title: Text('Account'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Accounts()));
                  }),
            ),
            Card(child: ListTile(title: Text('About us'), onTap: () {})),
            Card(child: ListTile(title: Text('Log Out'), onTap: () {}))
          ],
        )));
  }

  void updateName(String email) {
    setState(() {
      this.email ??= email;
    });
  }
}
