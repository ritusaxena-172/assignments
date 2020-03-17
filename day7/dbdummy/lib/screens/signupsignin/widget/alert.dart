import 'package:dbdummy/model/login_model.dart';
import 'package:flutter/material.dart';

// alertMessage(errorMessage) {
//  return AlertDialog alert = AlertDialog(
//     title: Text(
//       "Alert!",
//       style: TextStyle(color: Colors.red),
//     ),
//     content: Text("errorMessage"),
//   );
// }

showAlertDialog(BuildContext context, String errorMessage) {
  // set up the buttons
  Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        isLoading = false;
      });
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Alert!",
      style: TextStyle(color: Colors.red),
    ),
    content: Text("$errorMessage"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
