import 'package:app/login_dummy.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Login_Screen(),
    );
  }
}