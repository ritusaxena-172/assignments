import 'package:dbdummy/login.dart';
import 'package:dbdummy/verifyphone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
  bool secure1 = true;
  bool secure2 = true;
  String password, name, email, phone;

  final formKey = GlobalKey<FormState>();
  //above strings are storing the value of each respective field

  //autovalidate is false but on tap it will become true and the
  bool _autovalidatename = false;
  bool _autovalidateemail = false;
  bool _autovalidatepassword = false;
  bool _autoconfirmpassword = false;
  bool _autovalidatenumber = false;

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

  String numberValidation(String value) {
    if (value.length < 10)
      return 'Enter a valid phone number';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: formKey,
      child: Column(children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: TextFormField(
              autovalidate: _autovalidatename,
              onEditingComplete: () {
                setState(() {
                  _autovalidatename = true;
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
                  name = value;
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
              autovalidate: _autovalidateemail,
              onEditingComplete: () {
                setState(() {
                  _autovalidateemail = true;
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
                  email = value;
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
              autovalidate: _autovalidatenumber,
              onEditingComplete: () {
                setState(() {
                  _autovalidateemail = true;
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
                  phone = value;
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
              autovalidate: _autovalidatepassword,
              onEditingComplete: () {
                setState(() {
                  _autovalidatepassword = true;
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
                  password = value;
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
              autovalidate: _autoconfirmpassword,
              onEditingComplete: () {
                setState(() {
                  _autoconfirmpassword = true;
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
                  password = value;
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
                onPressed: () async {
                  final formState = formKey.currentState;
                  if (formState.validate()) {
                    formState.save();
                    try {
                      AuthResult user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyPhone(phone)),
                      );
                    } catch (e) {
                      print(e.message);
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('Successful')));
                    }
                  }
                },
                child: Text('SignUp'),
              )),
        ),
      ]),
    );
  }
}
