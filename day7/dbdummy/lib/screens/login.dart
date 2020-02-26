import 'package:dbdummy/components/login_components.dart';
import 'package:dbdummy/model/login_model.dart';
import 'package:dbdummy/screens/signup.dart';

import 'package:dbdummy/utils/color_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

//import 'package:gradient_app_bar/gradient_app_bar.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  void saveData() {
    String dataemail = signinemail;
    savePreference(dataemail);
  }

  createAlertDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Card(
              child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Change Password',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        obscureText: newPasswordVisible,
                        autovalidate: signinautovalidateemail,
                        onEditingComplete: () {
                          setState(() {
                            signinautovalidateemail = true;
                          });
                        },
                        validator: passwordValidation,
                        onChanged: (value) {
                          setState(() {
                            signinpassword = value;
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
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
                          autovalidate: signinautovalidateemail,
                          onEditingComplete: () {
                            setState(() {
                              signinautovalidateemail = true;
                            });
                          },
                          validator: confirmpassword,
                          onChanged: (value) {
                            setState(() {
                              signinemail = value;
                            });
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
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
            ),
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
                          colors: [firstcolor, secondcolor]),
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
                            autovalidate: signinautovalidateemail,
                            onEditingComplete: () {
                              setState(() {
                                signinautovalidateemail = true;
                              });
                            },
                            validator: emailValidation,
                            onChanged: (value) {
                              setState(() {
                                signinemail = value;
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
                            autovalidate: signinautovalidatepassword,
                            onEditingComplete: () {
                              setState(() {
                                signinautovalidatepassword = true;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                signinpassword = value;
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  createAlertDialogueBox(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Forgot password?'),
                                  //color: Colors.grey[300],
                                  alignment: Alignment.bottomRight,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                    child: RaisedButton(
                                  onPressed: () async {
                                    final formState = formKey.currentState;
                                    if (formState.validate()) {
                                      formState.save();
                                      saveData();
                                      try {
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email: signinemail,
                                                password: signinpassword);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()),
                                        );
                                      } catch (e) {
                                        if (signinemail == null) {
                                          print(e.message);
                                        }
                                      }
                                    }
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
                          ],
                        ),
                        // )
                      ],
                    )),
              ],
            )));
  }
}
