import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/provider/owner.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/services/sqflitehelper_utils.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/decorations.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

Pet pet;
DbPet _dbPet;
final kformKey = GlobalKey<FormState>();

class OwnerScreen extends StatefulWidget {
  @override
  _OwnerScreenState createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
  void submit(BuildContext context) {
    if (kformKey.currentState.validate()) {}
  }

  openCamera(BuildContext context) async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imagefiles = image;
        imageList.add(imagefiles);
        print('image is clicked');
      });
    } else {
      print("can't click image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Pet Registration form',
            style: TextStyle(color: light, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),
        ),
        body: Container(
          child: Form(
              key: kformKey,
              child: Column(children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(20),
                  child: IconButton(
                    iconSize: 50,
                    onPressed: () {
                      openCamera(context);
                      // Image.file(imagefiles);
                    },
                    icon: Icon(Icons.camera_alt),
                  ),

                  // ),
                )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: outlineTextFiled,
                        prefixIcon: Icon(
                          Icons.pets,
                          size: 20.0,
                          color: firstcolor,
                        ),
                        hintText: 'Enter your Pet\'s name',
                      ),
                      controller: petName,
                      autovalidate: validateName,
                      validator: (value) {
                        return value.isEmpty ? nullname : null;
                      },
                      onEditingComplete: () {
                        setState(() {
                          validateAge = true;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: outlineTextFiled,
                        prefixIcon: Icon(
                          Icons.pets,
                          size: 20.0,
                          color: firstcolor,
                        ),
                        hintText: 'Enter your Pet\'s age',
                      ),
                      controller: petAge,
                      autovalidate: validateAge,
                      validator: (value) {
                        return value.isEmpty ? nullage : null;
                      },
                      onEditingComplete: () {
                        setState(() {
                          validateName = true;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: outlineTextFiled,
                        prefixIcon: Icon(
                          Icons.pets,
                          size: 20.0,
                          color: firstcolor,
                        ),
                        hintText: 'Enter your Pets\'s breed',
                      ),
                      controller: petBreed,
                      autovalidate: validateBreed,
                      validator: (value) {
                        return value.isEmpty ? nullbreed : null;
                      },
                      onEditingComplete: () {
                        setState(() {
                          validateBreed = true;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: outlineTextFiled,
                        prefixIcon: Icon(
                          Icons.description,
                          size: 20.0,
                          color: firstcolor,
                        ),
                        hintText: 'Enter your Pets\'s description',
                      ),
                      controller: petDescription,
                      autovalidate: validateDescription,
                      validator: (value) {
                        return value.isEmpty ? nullbreed : null;
                      },
                      onEditingComplete: () {
                        setState(() {
                          validateDescription = true;
                        });
                      },
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 300,
                    height: 10,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      color: firstcolor,
                      shape: buttonborder,
                      onPressed: () {
                        onPressOwner(context);
                        // _dbDog.deleteTable();
                        //Navigator.pushNamed(context, Routes().homeScreen);
                        // onPressOwner2(context);
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ),
                // Image.asset(imagefiles.toString())
              ])),
        ));
  }
}
