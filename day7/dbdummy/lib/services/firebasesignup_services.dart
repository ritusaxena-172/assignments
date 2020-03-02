import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

final userCollection = Firestore.instance.collection('users');
FirebaseAuth auth = FirebaseAuth.instance;

Future<void> authenticate() async {
  try {
    await auth.createUserWithEmailAndPassword(
        email: signupemail, password: signuppassword);
  } catch (e) {
    print(e.message);
  }
}
