import 'dart:ffi';

import 'package:dbdummy/model/login_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String errorMessage;
// firebase login
Future userLogin(context) async {
  try {
    flag = 0;
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinemail, password: signinpassword);
    getUID();
    await Navigator.pushReplacementNamed(context, Routes().homeScreen);
    return flag;
  } catch (error) {
    print(error);
    switch (error.code) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Your email address appears to be malformed.";
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_WRONG_PASSWORD":
        errorMessage = "Your password is wrong.";
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "User with this email doesn't exist.";
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "User with this email has been disabled.";
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_USER_TOKEN_EXPIRED":
        errorMessage = "Invalid credentials, the password is changed.";
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE ":
        errorMessage = "Email already in use.";
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_NETWORK_REQUEST_FAILED":
        errorMessage = "No internet, network can\'t be found ";
        showAlertDialog(context, errorMessage);
        break;
      default:
        errorMessage = "An undefined Error happened.";
        showAlertDialog(context, errorMessage);
    }
  }
  if (errorMessage != null) {
    return Future.error(errorMessage);
  }
}
