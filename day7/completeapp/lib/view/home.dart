// import 'dart:html';

import 'package:completeapp/model/home_view.dart';
import 'package:completeapp/view/camera.dart';
import 'package:completeapp/view/todolist.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _cIndex = 0;
  void method(index) {
    setState(() {
      id = index;
    });
  }

  // void _incrementTab(index) {
  //   setState(() {
  //     _cIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo, title: Text('Tv/Movie Mania')),
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: DrawerHeader(
                child: UserAccountsDrawerHeader(
                  accountEmail: Text('Ritu Saxena'),
                  accountName: Text('ritu.saxena109@gmail.com'),
                  currentAccountPicture:
                      Image.asset('assets/images/splashscreen.png'),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: image.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                    title: Text(name[index]),
                    onTap: () {
                      method(index);
                      Navigator.pop(context);
                    },
                  ));
                },
              ),
            )
          ],
        )),
        //
        body: Column(
          children: <Widget>[
            Container(
              child: image[id],
              width: 500,
            ),
            Expanded(
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                  Container(
                    height: 100,
                    // width: 200,
                    child: Image.asset(
                      'assets/images/hor1.jpg',
                    ),
                  ),
                  Container(
                    height: 400,
                    // width: 100,
                    // color: Colors.amber[500],
                    child: Image.asset('assets/images/hor2.jpg'),
                  ),
                  Container(
                    height: 100,
                    //width: 100,
                    //color: Colors.amber[100],
                    child: Image.asset('assets/images/hor3.jpg'),
                  ),
                  Container(
                    height: 100,
                    //width: 100,
                    //color: Colors.amber[100],
                    child: Image.asset('assets/images/hor4.jpg'),
                  )
                ]))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _cIndex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.grey[700]),
                  title: new Text('Home')),
              BottomNavigationBarItem(
                icon: Icon(Icons.filter_list, color: Colors.grey[700]),
                title: new Text('List'),
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_contact_calendar,
                      color: Colors.grey[700]),
                  title: new Text('Contact')),
            ],
            onTap: (int index) {
              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ToDoList()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraScreen()),
                );
              }
            }));
  }
}
