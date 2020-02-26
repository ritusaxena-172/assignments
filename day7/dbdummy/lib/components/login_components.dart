import 'package:dbdummy/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

String emailValidation(String value) {
  if (value != null && value.isEmpty)
    return 'Email cannot be null';
  else if (!value.contains('@'))
    return 'Enter a valid email address';
  else
    return null;
}

String passwordValidation(String value) {
  signinpassword = value;
  if (signinpassword != null && signinpassword.length < 8)
    return 'Mandatory 8 characters are required';
  else
    return null;
}

String confirmpassword(String value) {
  if (signinpassword != value)
    return 'Password does not matches';
  else
    return null;
}

//shared preferences

Future<bool> savePreference(String dataemail) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', dataemail);
  return prefs.commit();
}

Future<String> getPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String dataemail = prefs.getString('email');
  return dataemail;
}
