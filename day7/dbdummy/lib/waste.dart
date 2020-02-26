// import 'package:dbdummy/components/login_components.dart';
// import 'package:dbdummy/model/login_model.dart';
// import 'package:dbdummy/screens/homescreen.dart';
// import 'package:dbdummy/screens/signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// //import 'package:gradient_app_bar/gradient_app_bar.dart';
// class Login_Screen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return Login_ScreenState();
//   }
// }

// class Login_ScreenState extends State<Login_Screen> {
//   void saveData() {
//     String dataemail = email;
//     savePreference(dataemail);
//   }

//   createAlertDialogueBox(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return Dialog(
//             child: Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.red, width: 4),
//                 ),
//                 child: Column(children: <Widget>[
//                   Expanded(
//                     flex: 1,
//                     child: TextFormField(
//                       obscureText: newPasswordVisible,
//                       autovalidate: autovalidateemail,
//                       onEditingComplete: () {
//                         setState(() {
//                           autovalidateemail = true;
//                         });
//                       },
//                       validator: passwordValidation,
//                       onChanged: (value) {
//                         setState(() {
//                           password = value;
//                         });
//                       },
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: Colors.indigo)),
//                         prefixIcon: Icon(
//                           Icons.lock,
//                           size: 20.0,
//                           color: Colors.blueGrey,
//                         ),
//                         hintText: 'Enter New Password',
//                       ),
//                       // controller: newPassword,
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       child: TextFormField(
//                         obscureText: newPasswordVisible,
//                         autovalidate: autovalidateemail,
//                         onEditingComplete: () {
//                           setState(() {
//                             autovalidateemail = true;
//                           });
//                         },
//                         validator: confirmpassword,
//                         onChanged: (value) {
//                           setState(() {
//                             email = value;
//                           });
//                         },
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.indigo)),
//                           prefixIcon: Icon(
//                             Icons.mail,
//                             size: 20.0,
//                             color: Colors.blueGrey,
//                           ),
//                           hintText: 'Confirm New Password',
//                         ),
//                         // controller: newPasswordConfirm,
//                       ),
//                     ),
//                   ),
//                   Container(
//                       child: RaisedButton(
//                     onPressed: () {
//                       //   if (newPassword.text == newPasswordConfirm.text) {
//                       //     return 'successful!';
//                       //   } else {
//                       //     return 'enter same password';
//                       //   }
//                     },
//                     child: Text('Submit'),
//                   )),
//                 ])),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         body: Form(
//             key: formKey,
//             child: Column(
//               children: <Widget>[
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     padding: EdgeInsets.all(100),
//                     child: Center(
//                       child: Text('PawSome!',
//                           style: TextStyle(
//                             fontSize: 40,
//                             fontStyle: FontStyle.italic,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           )),
//                     ),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomRight,
//                           stops: [0.2, 1],
//                           colors: [Colors.blueGrey, Colors.red]),
//                       color: Colors.blueGrey,
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(170),
//                         // bottomRight: Radius.circular(50)
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                     flex: 1,
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.all(20),
//                           child: TextFormField(
//                             autovalidate: autovalidateemail,
//                             onEditingComplete: () {
//                               setState(() {
//                                 autovalidateemail = true;
//                               });
//                             },
//                             validator: emailValidation,
//                             onChanged: (value) {
//                               setState(() {
//                                 email = value;
//                               });
//                             },
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(color: Colors.indigo)),
//                               prefixIcon: Icon(
//                                 Icons.mail,
//                                 size: 20.0,
//                                 color: Colors.blueGrey,
//                               ),
//                               hintText: 'Enter email id',
//                             ),
//                             // controller: email,
//                           ), // ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(20),
//                           child: TextFormField(
//                             autovalidate: autovalidatepassword,
//                             onEditingComplete: () {
//                               setState(() {
//                                 autovalidatepassword = true;
//                               });
//                             },
//                             onChanged: (value) {
//                               setState(() {
//                                 password = value;
//                               });
//                             },
//                             obscureText: passwordVisible,
//                             decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide:
//                                         BorderSide(color: Colors.indigo)),
//                                 prefixIcon: Icon(
//                                   Icons.lock,
//                                   size: 20.0,
//                                   color: Colors.blueGrey,
//                                 ),
//                                 hintText: 'Enter password',
//                                 suffixIcon: IconButton(
//                                     icon: Icon(
//                                       passwordVisible
//                                           ? Icons.visibility_off
//                                           : Icons.visibility,
//                                       color: Colors.blueGrey,
//                                     ),
//                                     onPressed: () {
//                                       setState(() {
//                                         passwordVisible = !passwordVisible;
//                                       });
//                                     })),
//                             //controller: password,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             // GestureDetector(
//                             //     onTap: () {},
//                             //     child: Row(children: <Widget>[
//                             //       Container(
//                             //         child: Checkbox(
//                             //             checkColor: Colors.grey,
//                             //             activeColor: Colors.blueGrey,
//                             //             value: checkBoxValue,
//                             //             onChanged: (bool value) {
//                             //               setState(() async {
//                             //                 checkBoxValue = value;
//                             //                 if (checkBoxValue == true) {
//                             //                   saveData();
//                             //                   //   saveData();
//                             //                   //   setData();
//                             //                   //   print(checkBoxValue);
//                             //                   //   print(email.text);
//                             //                   //   print('$emailKey is');
//                             //                 } else {
//                             //                   return;
//                             //                 }
//                             //               });
//                             //             }),
//                             //       ),
//                             //       Container(
//                             //         padding: EdgeInsets.all(10),
//                             //         child: Text('Remember me'),
//                             //         // color: Colors.grey[300],
//                             //         // alignment: Alignment.bottomRight,
//                             //       ),
//                             //     ])),
//                             GestureDetector(
//                                 onTap: () {
//                                   createAlertDialogueBox(context);
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.all(10),
//                                   child: Text('Forgot password?'),
//                                   //color: Colors.grey[300],
//                                   alignment: Alignment.bottomLeft,
//                                 ))
//                           ],
//                         ),
//                         //  ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             Expanded(
//                                 child: Container(
//                                     // margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                                     child: RaisedButton(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(24)),
//                               onPressed: () async {
//                                 final formState = formKey.currentState;
//                                 if (formState.validate()) {
//                                   formState.save();
//                                   try {
//                                     AuthResult user = await FirebaseAuth
//                                         .instance
//                                         .signInWithEmailAndPassword(
//                                             email: email, password: password);
//                                     Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => HomeScreen()),
//                                     );
//                                   } catch (e) {
//                                     print(e.message);
//                                   }
//                                 }
//                               },
//                               // padding:
//                               // EdgeInsets.fromLTRB(120, 20, 120, 20)
//                               child: Text('Login'),
//                             ))),
//                             Expanded(
//                                 child: Container(
//                                     // margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
//                                     child: RaisedButton(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(24)),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Signup()),
//                                 );
//                               },
//                               // padding:
//                               //     EdgeInsets.fromLTRB(120, 5, 120, 5),
//                               child: Text('Sigup'),
//                             )))
//                           ],
//                         )
//                       ],
//                     ))
//               ],
//             )));
//   }
// }
