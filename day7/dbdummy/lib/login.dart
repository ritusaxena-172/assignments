import 'package:dbdummy/homescreen.dart';
import 'package:dbdummy/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:gradient_app_bar/gradient_app_bar.dart';
class Login_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Login_ScreenState();
  }
}

class Login_ScreenState extends State<Login_Screen> {
  String email, password, newPassword, newPasswordConfirm;
  final formKey = GlobalKey<FormState>();
  bool _autovalidateemail = false;
  bool _autovalidatepassword = false;
  bool _autoconfirmpassword = false;
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  // TextEditingController newPassword = TextEditingController();
  // TextEditingController newPasswordConfirm = TextEditingController();
  bool passwordVisible = true;
  bool newPasswordVisible = true;
  bool newConfirmPasswordVisible = true;
  bool checkBoxValue = false;
  String emailKey = '';

  String emailValidation(String value) {
    if (value != null && value.isEmpty)
      return 'Email cannot be null';
    else if (!value.contains('@'))
      return 'Enter a valid email address';
    else
      return null;
  }

  String passwordValidation(String value) {
    password = value;
    if (password != null && password.length < 8)
      return 'Mandatory 8 characters are required';
    else
      return null;
  }

  String confirmpassword(String value) {
    if (password != value)
      return 'Password does not matches';
    else
      return null;
  }

  // Future<bool> saveData() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return await preferences.setString(emailKey, email.text);
  //   print('inside save data');
  // }

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(emailKey);
    print('inside load data');
  }

  // setData() {
  //   loadData().then((value) {
  //     setState:
  //     () {
  //       email.text = value;
  //       print(value);
  //       print('inside set data');
  //     };
  //   });
  // }

  createAlertDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 4),
                ),
                child: Column(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      obscureText: newPasswordVisible,
                      autovalidate: _autovalidateemail,
                      onEditingComplete: () {
                        setState(() {
                          _autovalidateemail = true;
                        });
                      },
                      validator: passwordValidation,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.indigo)),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 20.0,
                          color: Colors.blueGrey,
                        ),
                        hintText: 'Enter New Password',
                      ),
                      // controller: newPassword,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: TextFormField(
                        obscureText: newPasswordVisible,
                        autovalidate: _autovalidateemail,
                        onEditingComplete: () {
                          setState(() {
                            _autovalidateemail = true;
                          });
                        },
                        validator: confirmpassword,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.indigo)),
                          prefixIcon: Icon(
                            Icons.mail,
                            size: 20.0,
                            color: Colors.blueGrey,
                          ),
                          hintText: 'Confirm New Password',
                        ),
                        // controller: newPasswordConfirm,
                      ),
                    ),
                  ),
                  Container(
                      child: RaisedButton(
                    onPressed: () {
                      //   if (newPassword.text == newPasswordConfirm.text) {
                      //     return 'successful!';
                      //   } else {
                      //     return 'enter same password';
                      //   }
                    },
                    child: Text('Submit'),
                  )),
                ])),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(100),
                    child: Center(
                      child: Text('PawSome!',
                          style: TextStyle(
                            fontSize: 40,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          stops: [0.2, 1],
                          colors: [Colors.blueGrey, Colors.red]),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(170),
                        // bottomRight: Radius.circular(50)
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20),
                          child: TextFormField(
                            autovalidate: _autovalidateemail,
                            onEditingComplete: () {
                              setState(() {
                                _autovalidateemail = true;
                              });
                            },
                            validator: emailValidation,
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.indigo)),
                              prefixIcon: Icon(
                                Icons.mail,
                                size: 20.0,
                                color: Colors.blueGrey,
                              ),
                              hintText: 'Enter email id',
                            ),
                            // controller: email,
                          ), // ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: TextFormField(
                            autovalidate: _autovalidatepassword,
                            onEditingComplete: () {
                              setState(() {
                                _autovalidatepassword = true;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.indigo)),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 20.0,
                                  color: Colors.blueGrey,
                                ),
                                hintText: 'Enter password',
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    })),
                            //controller: password,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {},
                                child: Row(children: <Widget>[
                                  Container(
                                    child: Checkbox(
                                        checkColor: Colors.grey,
                                        activeColor: Colors.blueGrey,
                                        value: checkBoxValue,
                                        onChanged: (bool value) {
                                          setState(() {
                                            checkBoxValue = value;
                                            // if (checkBoxValue == true) {
                                            //   saveData();
                                            //   setData();
                                            //   print(checkBoxValue);
                                            //   print(email.text);
                                            //   print('$emailKey is');
                                            // } else {
                                            //   return 0;
                                            // }
                                          });
                                        }),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text('Remember me'),
                                    color: Colors.grey[300],
                                    // alignment: Alignment.bottomRight,
                                  ),
                                ])),
                            GestureDetector(
                                onTap: () {
                                  createAlertDialogueBox(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Forgot password?'),
                                  color: Colors.grey[300],
                                  // alignment: Alignment.bottomLeft,
                                ))
                          ],
                        ),
                        //  ),
                        // Expanded(

                        // child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                                child: RaisedButton(
                              onPressed: () async {
                                final formState = formKey.currentState;
                                if (formState.validate()) {
                                  formState.save();
                                  try {
                                    AuthResult user = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                            email: email, password: password);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                                  } catch (e) {
                                    print(e.message);
                                  }
                                }
                                // if (email.text == 'Chhavi' &&
                                //     password.text == 'Puri') {
                                //   print('login successful');
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => HomeScreen()),
                                //   );
                                // } else {
                                //   return 'Invalid Details';
                                // }
                              },
                              child: Text('Login'),
                            )),
                            Container(
                                child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()),
                                );
                              },
                              child: Text('Sigup'),
                            ))
                          ],
                        )
                        // )
                      ],
                    )),
              ],
            )));
  }
}
