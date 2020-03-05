import 'package:dbdummy/model/login_model.dart';
import 'package:dbdummy/provider/signin.dart';
import 'package:dbdummy/provider/validators.dart';
import 'package:dbdummy/screens/signupsignin/tabcontroller.dart';
import 'package:dbdummy/screens/signupsignin/widget/background.dart';
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
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      Expanded(
                        // flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            shape: BoxShape.rectangle,
                            //  boxShadow: kElevationToShadow[200],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 90, 20, 0),
                                  child: TextFormField(
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
                                  ), // ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 90, 20, 0),
                                  child: TextFormField(
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
                                                passwordVisible =
                                                    !passwordVisible;
                                              });
                                            })), //controller: password,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
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
                              ),
                              Container(
                                width: 300,
                                height: 70,
                                margin: EdgeInsets.only(bottom: 130),
                                padding: EdgeInsets.all(5),
                                child: RaisedButton(
                                  color: firstcolor,
                                  shape: buttonborder,

                                  // disabledBorderColor: Colors.grey,
                                  onPressed: () {
                                    // setState(() {
                                    //   isLoading = true;
                                    // });
                                    onPressedLogin(context);
                                    setState(() {
                                      isLoading = true;
                                    });
                                  },
                                  child: Text('SignIn'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //)
                    ]),
        ),
      ]),
    );
  }
}
