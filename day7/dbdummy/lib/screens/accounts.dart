import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar.dart';
import 'package:dbdummy/services/firebasesignup_services.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  String uid;

  FirebaseAuth auth = FirebaseAuth.instance;

  // void inputData() async {
  //   final FirebaseUser user = await auth.currentUser();
  //   if(user!=null){
  //     print('logged in');
  //   }}
  //   Future<String> inputData() async {
  //   final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  //   final String uid = user.uid.toString();
  // return uid;
  // }
  //final uid = user.uid;
  // here you write the codes to input the data into firestore

//   Firebase.Auth.FirebaseUser user = auth.CurrentUser;
// if (user != null) {
//   string name = user.DisplayName;
//   string email = user.Email;
//   System.Uri photo_url = user.PhotoUrl;
//   // The user's Id, unique to the Firebase project.
//   // Do NOT use this value to authenticate with your backend server, if you
//   // have one; use User.TokenAsync() instead.
//   string uid = user.UserId;
// }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
            //borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
          ),
          centerTitle: true,
          title: Text(
            'Accounts',
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
        body: FutureBuilder<FirebaseUser>(
          future: FirebaseAuth.instance.currentUser(),
          builder:
              (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return new Text(snapshot.data.uid);
            } else {
              return new Text('Loading...');
            }
            return Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: CircleAvatar(
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        size: 80.0,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 0),

                    child: Text(snapshot.data[uid]['name']),

                    //     child: TextField(

                    //       decoration: InputDecoration(

                    //         enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(80),
                    //             borderSide: BorderSide(color: Colors.indigo)),
                    //         prefixIcon: Icon(
                    //           Icons.person_outline,
                    //           size: 20.0,
                    //           color: Colors.blueGrey,
                    //         ),
                    //       ),
                    //     ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide: BorderSide(color: Colors.indigo)),
                        prefixIcon: Icon(
                          Icons.mail,
                          size: 20.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide: BorderSide(color: Colors.indigo)),
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 20.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FloatingActionButton(
                    child: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                )
              ],
            );
          },
        ));
  }
}
