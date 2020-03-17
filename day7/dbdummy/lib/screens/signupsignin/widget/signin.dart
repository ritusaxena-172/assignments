import 'package:dbdummy/model/login_model.dart';
import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/provider/signin.dart';
import 'package:dbdummy/provider/validators.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/tabcontroller.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/screens/signupsignin/widget/background.dart';
import 'package:dbdummy/services/firebaselogin.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/decorations.dart';
import 'package:flutter/material.dart';

import 'drawersigin.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: ksiginformKey,
      child: Stack(children: <Widget>[
        Background(),
        Container(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: ListView(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          autovalidate: autovalidateemail,
                          onEditingComplete: () {
                            setState(() {
                              autovalidateemail = true;
                            });
                          },
                          validator: emailValidation,
                          onChanged: (value) {
                            setState(() {
                              signinemail = value;
                            });
                          },
                          // decoration: outlineTextFiled
                          //copyWith(
                          //   labelText: 'Username?',
                          //   prefixIcon: Icon(
                          //     Icons.person,
                          //     color: Color(0xffffffff),
                          //   ),
                          // ),

                          decoration: InputDecoration(
                            enabledBorder: outlineTextFiled,
                            prefixIcon: Icon(
                              Icons.mail,
                              size: 20.0,
                              color: firstcolor,
                            ),
                            hintText: 'Enter email id',
                          ),
                          // controller: email,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          autovalidate: autovalidatepassword,
                          onEditingComplete: () {
                            setState(() {
                              autovalidatepassword = true;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              signinpassword = value;
                            });
                          },
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                              enabledBorder: outlineTextFiled,
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 20.0,
                                color: firstcolor,
                              ),
                              hintText: 'Enter password',
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: firstcolor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  })), //controller: password,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return LoginAlert();
                                  });
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 100),
                              padding: EdgeInsets.all(5),
                              child: Text('Forgot password?',
                                  style: TextStyle(
                                      color: firstcolor,
                                      fontStyle: FontStyle.italic)),
                              //color: Colors.grey[300],
                              alignment: Alignment.bottomRight,
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 300,
                          height: 70,
                          margin: EdgeInsets.only(bottom: 130),
                          padding: EdgeInsets.all(5),
                          child: RaisedButton(
                            color: firstcolor,
                            shape: buttonborder,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              onPressedLogin(context);
                            },
                            child: Text('SignIn'),
                          ),
                        ),
                      ]),
                ),
        ),
      ]),
    );
  }
}
