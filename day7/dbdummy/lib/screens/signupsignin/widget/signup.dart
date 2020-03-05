import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/login_model.dart';
import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/provider/signup.dart';
import 'package:dbdummy/provider/validators.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/tabcontroller.dart';
import 'package:dbdummy/screens/signupsignin/widget/background.dart';
import 'package:dbdummy/services/firebasesignup_services.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/decorations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

String uid;

class _SignupState extends State<Signup> {
  // void add() async {
  //   uid = (await FirebaseAuth.instance.currentUser()).uid;
  //   print('firebase function');
  //   print(uid);
  //   Map<String, String> data = <String, String>{
  //     "name": signupname,
  //     // "email": signupemail,
  //     // "password": signuppassword,
  //     "phone number": signupphone,
  //     "user id": uid,
  //   };
  //   authenticate();
  //   userCollection.document(uid).setData(data).then((_) {
  //     Navigator.pushNamed(context, Routes().temp);
  //   });
  // }

  // Future<void> authenticate() async {
  //   try {
  //     print('after firebase func');
  //     print(uid);
  //     await auth.createUserWithEmailAndPassword(
  //         email: signupemail, password: signuppassword);
  //   } catch (e) {
  //     print(e.message);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: ksigupformKey,
        child: Stack(children: <Widget>[
          Background(),
          Column(mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                    ),
                    child: Column(children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            autovalidate: autovalidatename,
                            onEditingComplete: () {
                              setState(() {
                                autovalidatename = true;
                              });
                            },
                            decoration: InputDecoration(
                              enabledBorder: outlineTextFiled,
                              prefixIcon: Icon(
                                Icons.person,
                                size: 20.0,
                                color: firstcolor,
                              ),
                              labelText: 'Name',
                              hintStyle: TextStyle(color: firstcolor),
                              //icon: Icon(Icons.person, color: firstcolor),
                            ),
                            validator: nameValidation,
                            onChanged: (value) {
                              setState(() {
                                signupname = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.rectangle),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            autovalidate: autovalidateemail,
                            onEditingComplete: () {
                              setState(() {
                                autovalidateemail = true;
                              });
                            },
                            decoration: InputDecoration(
                              enabledBorder: outlineTextFiled,
                              prefixIcon: Icon(
                                Icons.mail,
                                size: 20.0,
                                color: firstcolor,
                              ),
                              labelText: 'Email',
                              hintStyle: TextStyle(color: firstcolor),
                            ),
                            validator: emailValidation,
                            onChanged: (value) {
                              setState(() {
                                signupemail = value;
                              });
                            },
                          ),
                        ),
                      ),
                      //phone number
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.rectangle),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            autovalidate: autovalidatenumber,
                            onEditingComplete: () {
                              setState(() {
                                autovalidateemail = true;
                              });
                            },
                            decoration: InputDecoration(
                              enabledBorder: outlineTextFiled,
                              prefixIcon: Icon(
                                Icons.phone,
                                size: 20.0,
                                color: firstcolor,
                              ),
                              labelText: 'Phone',
                              hintStyle: TextStyle(color: firstcolor),
                            ),
                            validator: numberValidation,
                            onChanged: (value) {
                              setState(() {
                                signupphone = value;
                              });
                            },
                          ),
                        ),
                      ),
                      //for password
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.rectangle),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            obscureText: secure1,
                            autovalidate: autovalidatepassword,
                            onEditingComplete: () {
                              setState(() {
                                autovalidatepassword = true;
                              });
                            },
                            decoration: InputDecoration(
                              enabledBorder: outlineTextFiled,
                              prefixIcon: Icon(
                                Icons.enhanced_encryption,
                                size: 20.0,
                                color: firstcolor,
                              ),
                              hintStyle: TextStyle(color: firstcolor),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  secure1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: firstcolor,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    secure1 = !secure1;
                                  });
                                },
                              ),
                            ),
                            validator: passwordValidation,
                            onChanged: (value) {
                              setState(() {
                                signuppassword = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            obscureText: secure2,
                            autovalidate: autoconfirmpassword,
                            onEditingComplete: () {
                              setState(() {
                                autoconfirmpassword = true;
                              });
                            },
                            decoration: InputDecoration(
                              enabledBorder: outlineTextFiled,
                              prefixIcon: Icon(
                                Icons.enhanced_encryption,
                                size: 20.0,
                                color: firstcolor,
                              ),
                              labelText: 'Confirm Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  secure1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: firstcolor,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    secure1 = !secure1;
                                  });
                                },
                              ),
                            ),
                            validator: confirmpassword,
                            onChanged: (value) {
                              setState(() {
                                signuppassword = value;
                              });
                            },
                          ),
                        ),
                      ),

                      Container(
                          padding: EdgeInsets.all(10),
                          width: 320,
                          height: 80,
                          margin: EdgeInsets.all(10),
                          child: RaisedButton(
                            color: firstcolor,
                            shape: buttonborder,
                            onPressed: () async {
                              final formState = ksigupformKey.currentState;
                              if (formState.validate()) {
                                formState.save();
                                try {
                                  userSignup(context);
                                } catch (e) {
                                  print(e.message);
                                }
                              }
                            },
                            child: Text('SignUp'),
                          )),
                    ]),
                  ),
                )
              ])
        ]));
  }
}
