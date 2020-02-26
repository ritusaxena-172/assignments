//import 'package:app/main.dart';
//import 'package:app/signup.dart';

import 'package:completeapp/view/signup.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool secure = true;
  bool _obscureText1 = true, _obscureText2 = true;
  var email = TextEditingController();
  var password = TextEditingController();
  var changepassword = TextEditingController();
  var confirmpassword = TextEditingController();

  // createAlertDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Dialog(
  //             elevation: 25.0,
  //             //title: Text('Change Password'),
  //             child: );
  //       });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                      //padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        controller: email,
                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Enter your email id',
                            hintStyle: TextStyle(color: Colors.grey[700]),
                            icon: Icon(Icons.mail, color: Colors.grey[700])),
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      //padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        controller: password,
                        autocorrect: true,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.grey[700]),
                            icon: Icon(Icons.enhanced_encryption,
                                color: Colors.grey[700])),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: RaisedButton(
                            onPressed: () {
                              if (email.text == 'ritu' &&
                                  password.text == 'ritu') {
                                print('Login button');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              }
                            },
                            child: Text('Login'),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()),
                                );
                              },
                              child: Text('SignUp'),
                            ),
                          ))
                    ],
                  )),
                ),

                //Alert Dialog box

                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      //child: Container(
                      child: Text('Forgot Password?',
                          style: TextStyle(color: Colors.grey[700])),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                    height: 300,
                                    width: 300,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: TextField(
                                              controller: changepassword,
                                              obscureText: _obscureText1,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                labelText: 'Password',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                icon: Icon(
                                                    Icons.enhanced_encryption,
                                                    color: Colors.grey),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    _obscureText1
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _obscureText1 =
                                                          !_obscureText1;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                child: TextField(
                                              controller: confirmpassword,
                                              obscureText: secure,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                labelText: 'Confirm Password',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                icon: Icon(
                                                    Icons.enhanced_encryption,
                                                    color: Colors.grey),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    secure
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      secure = !secure;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ))),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.all(10),
                                              child: RaisedButton(
                                                onPressed: () {
                                                  if (changepassword
                                                          .text.isNotEmpty &&
                                                      confirmpassword
                                                          .text.isNotEmpty) {
                                                    if (confirmpassword.text ==
                                                        changepassword.text) {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Home()),
                                                      );
                                                    }
                                                  }
                                                },
                                                child: Text('Change Password'),
                                              ),
                                            ))
                                      ],
                                    )),
                              );
                            });
                      },
                    )),
              ],
            )));
  }
}
