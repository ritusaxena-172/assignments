import 'package:dbdummy/screens/signupsignin/tabcontroller.dart';
import 'package:dbdummy/services/firebaselogin.dart';
import 'package:dbdummy/services/sharedprefs_services.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

onPressedLogin(BuildContext context) async {
  final formState = ksiginformKey.currentState;
  if (formState.validate()) {
    formState.save();
    saveData();
    userLogin(context);
  }
}
