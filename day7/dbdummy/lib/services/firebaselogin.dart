import 'package:dbdummy/model/login_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

userLogin(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinemail, password: signinpassword);
    await Navigator.pushReplacementNamed(context, Routes().homeScreen);
  } catch (e) {
    flag = 1;
    print(e.message);
  }
  if (flag != 0) {
    isLoading = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  print('oader val $isLoading');
}
