import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// final userCollection = Firestore.instance.collection('users');
// //
// FirebaseAuth auth = FirebaseAuth.instance;

userSignup(context) {
  try {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: signupemail, password: signuppassword)
        .then((currentUser) => Firestore.instance
                .collection("users")
                .document(currentUser.user.uid)
                .setData({
              "uid": currentUser.user.uid,
              "name": signupname,
              "phone number": signupphone,
              "currentUSERID": currentUser.user.uid,
            }).then((result) => {
                      Navigator.pushNamed(context, Routes().temp),
                    }));
  } catch (error) {
    print(error);
  }
}
