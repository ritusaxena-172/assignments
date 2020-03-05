import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/ownerscreen.dart';
import 'package:dbdummy/services/sqflitehelper_utils.dart';
import 'package:flutter/cupertino.dart';

DbDog _dbDog = DbDog();
onPressOwner(context) {
  if (kformKey.currentState.validate()) {
    Dog dogg = Dog(
      name: petName.text,
      age: petAge.text,
      breed: petBreed.text,
    );
    _dbDog.insertDog(dogg).then((id) {
      petName.clear();
      petAge.clear();
      petBreed.clear();
    });
    // print('${dogg.name}');
    Navigator.pushNamed(context, Routes().homeScreen);
  }
}
