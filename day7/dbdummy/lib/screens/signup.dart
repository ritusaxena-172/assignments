import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Formpage(),
      ),
    );
  }
}

class Formpage extends StatefulWidget {
  @override
  _FormpageState createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  final formKey = GlobalKey<FormState>();
  final userCollection = Firestore.instance.collection('users');

  Future<void> authenticate() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signupemail, password: signuppassword);
    } catch (e) {
      print(e.message);
    }
  }

  void add() async {
    String uid = (await FirebaseAuth.instance.currentUser()).uid;
    Map<String, String> data = <String, String>{
      "name": signupname,
      "email": signupemail,
      "password": signuppassword,
      "phone number": signupphone,
      "user id": uid,
    };
    userCollection.document(uid).setData(data).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  String nameValidation(String value) {
    if (value != null && value.isEmpty)
      return 'Name cannot be null';
    else if (value.contains(new RegExp(r'^[0-9]'))) return 'Enter a valid name';
    return null;
  }

  String emailValidation(String value) {
    if (value != null && value.isEmpty)
      return 'Email cannot be null';
    else if (!value.contains('@'))
      return 'Enter a valid email address';
    else
      return null;
  }

  String passwordValidation(String value) {
    signuppassword = value;
    if (signuppassword != null && signuppassword.length < 8)
      return 'Mandatory 8 characters are required';
    else
      return null;
  }

  String confirmpassword(String value) {
    if (signuppassword != value)
      return 'Password does not matches';
    else
      return null;
  }

  String numberValidation(String value) {
    if (value.length < 10)
      return 'Enter a valid phone number';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.grey],
          ),
          border: Border.all(
            color: Colors.blueGrey,
            width: 3,
          ),
        ),
        child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: TextFormField(
                autovalidate: signupautovalidatename,
                onEditingComplete: () {
                  setState(() {
                    signupautovalidatename = true;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.person, color: Colors.grey),
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
                autovalidate: signupautovalidateemail,
                onEditingComplete: () {
                  setState(() {
                    signupautovalidateemail = true;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.email, color: Colors.grey),
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
                autovalidate: signupautovalidatenumber,
                onEditingComplete: () {
                  setState(() {
                    signupautovalidateemail = true;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.phone, color: Colors.grey),
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
                autovalidate: signupautovalidatepassword,
                onEditingComplete: () {
                  setState(() {
                    signupautovalidatepassword = true;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.enhanced_encryption, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      secure1 ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
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
                autovalidate: signupautoconfirmpassword,
                onEditingComplete: () {
                  setState(() {
                    signupautoconfirmpassword = true;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.enhanced_encryption, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      secure2 ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        secure2 = !secure2;
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
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(10),
                width: 100,
                height: 50,
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: (() async {
                    final formState = formKey.currentState;
                    if (formState.validate()) {
                      formState.save();
                      try {
                        authenticate();
                        add();
                      } catch (e) {
                        print(e.message);
                        // If the form is valid, display a Snackbar.
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Successful')));
                      }
                    }
                  }),
                  child: Text('SignUp'),
                )),
          ),
        ]),
      ),
    );
  }
}
