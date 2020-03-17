import 'package:dbdummy/model/buyer_model.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/buyserscreen.dart';
import 'package:dbdummy/screens/ownerscreen.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/services/sqflitehelper_utils.dart';
import 'package:flutter/cupertino.dart';

//DbPet _dbPet = DbPet();
onPressOwner(context) {
  if (kformKey.currentState.validate()) {
    // Pet pet = Pet(
    //   petName: petName.text,
    //   petAge: petAge.text,
    //   petBreed: petBreed.text,
    // );
    // _dbPet.insertPet(pet).then((id) {
    //   petName.clear();
    //   petAge.clear();
    //   petBreed.clear();
    // });
    // uploadMultipleImages();
    try {
      insertingDtaFirebase();
      // print('sign up name is $signupname');
    } catch (e) {
      print(e.message);
    }
    // print('${dogg.name}');
    Navigator.pushNamed(context, Routes().homeScreen);
  }
}

// onPressOwner2(context) {
//   print('inside owner on press');
//   BuyerScreen();
//   Dog pets = Dog(
//     name: petname,
//     age: age,
//     breed: breed,
//   );
//   print('pets age is ${pets.age}');
//   _dbDog.insertDog(pets);
// try {
//   insertingDtaFirebase();
//   print('sign up name is $signupname');
// } catch (e) {
//   print(e.message);
// }
// print('${dogg.name}');
//   Navigator.pushNamed(context, Routes().homeScreen);
// }

// if (kformKey.currentState.validate()) {
//                           Dog dogg = Dog(
//                             name: petName.text,
//                             age: petAge.text,
//                             breed: petBreed.text,
//                           );
//                           _dbDog.insertDog(dogg).then((id) {
//                             petName.clear();
//                             petAge.clear();
//                             petBreed.clear();
//                           });
//                           // _dbDog.deleteTable();
//                           uploadMultipleImages();
//                           // print('${dogg.name}');
//                           try {
//                            insertingDtaFirebase();
//                            print('sign up name is $signupname');
//                             } catch (e) {
//                              print(e.message);
//                              }
//                               Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                               builder: (context) => HomeScreen()));
//                         }
//                       },
