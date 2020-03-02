// import 'package:dbdummy/sqqflite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/screens/confirmadoption.dart';
import 'package:dbdummy/services/sqflitehelper_utils.dart';
import 'package:dbdummy/utils/color_services.dart';
//import 'package:dbdummy/utils/sqflitehelper_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:dbdummy/owner.dart';
class BuyerScreen extends StatefulWidget {
  @override
  _BuyerScreenState createState() => _BuyerScreenState();
}

class _BuyerScreenState extends State<BuyerScreen> {
  //Dog constructor for calling model
  Dog dog;
  DbDog _dbDoggy = DbDog();
  List<Dog> dogList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            // borderRadius:BorderRadius.circular(80),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          centerTitle: true,
          title: Text(
            'PawSome!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),
        ),
        body: FutureBuilder(
            future: _dbDoggy.getDogList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print('sjhajhd');
                dogList = snapshot.data;
                // print(dogList.length);

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: dogList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Dog doggy = dogList[index];
                      return Card(
                        child: ListTile(
                          title: Text('Name: ${doggy.name}'),
                          subtitle:
                              Text('Age: ${doggy.age}\nBreed: ${doggy.breed} '),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConfirmAdoption()),
                            );
                          },
                          // Text('image: ${doggy.image}'),
                          //Image.asset(doggy.image),
                          //title:
                        ),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
