import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/sqflitehelper_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

String petData;
final userCollection = Firestore.instance.collection('users');
final petCollection = Firestore.instance.collection('PetDetails');
final databaseReference = Firestore.instance;
// final definedCollection=Firestore.instance.collection.
// final databaseReference=Firestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
DbPet dbPet = DbPet();
Pet pet;
Future<String> getUID() async {
  print('inside uid');
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  uid = user.uid.toString();
  if (uid != null) {
    print('uid is not null $uid');
    return uid;
  } else {
    print('uid is null!');
    return null;
  }
}

//retrieve data from firebase
firebasedatatosqflite() async {
  int i;
  print('start');
  List<DocumentSnapshot> data =
      (await databaseReference.collection('PetDetails').getDocuments())
          .documents;
  final newData = data
      .map((DocumentSnapshot s) {
        return s.data;
      })
      .toList()
      .cast<Map<String, dynamic>>();
  print('before');
  for (i = 0; i < newData.length; i++) {
    dbPet.insertPet(newData.elementAt(i)).then((_) {
      print('inserted successfully');
    });
  }
  for (i = 0; i < newData.length; i++) {
    // Pet(uid: newData[i][petName],newData[i][uid],newData[i][petAge],newData[i][petBreed],newData[i][petDescription]);
    Pet(
        petName: newData[i]['petName'],
        uid: newData[i]['uid'],
        petAge: newData[i]['petAge'],
        petBreed: newData[i]['petBreed'],
        petDescription: newData[i]['petDescription']);
  }
  print('done');
}

void insertingDtaFirebase() async {
  print('Inside insertingDtaFirebase');
  print('uid is still $uid');
  Map<String, String> petInformation = <String, String>{
    "uid": uid,
    "petName": petName.text,
    "petAge": petAge.text,
    "petBreed": petBreed.text,
    "petDescription": petDescription.text,
  };
  petCollection.document(uid).setData(petInformation);
}

// insertFirebaseToSqflite(){
//   Map<String, String> firebasetosqflitepetInformation = <String, String>{
//     "Pet_name": petName.text,
//     "Pet_age": petAge.text,
//     "Pet_breed": petBreed.text,
//     "UID": uid,
//   };
// }

Future uploadMultipleImages() async {
  imageList.add(imagefiles);
  for (int i = 0; i <= imageList.length; i++) {
    StorageReference reference =
        FirebaseStorage.instance.ref().child("user_input/$i");
    StorageUploadTask uploadTask = reference.putFile(imagefiles);
    await uploadTask.onComplete;
    reference.getDownloadURL().then((fileURL) {
      imageUrls.add(fileURL);
      print(fileURL);
    });
  }
}
