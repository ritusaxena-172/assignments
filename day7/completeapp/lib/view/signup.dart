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
      appBar: AppBar(
        title: Text('Signup'),
        backgroundColor: Colors.grey,
      ),
      body: Formpage(),
    );
  }
}

class Formpage extends StatefulWidget {
  @override
  _FormpageState createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  bool secure = true;
  String password;

  final formKey = GlobalKey<FormState>();
  //above strings are storing the value of each respective field

  //autovalidate is false but on tap it will become true and the
  bool _autovalidatename = false;
  bool _autovalidateemail = false;
  bool _autovalidatepassword = false;
  bool _autoconfirmpassword = false;

  String nameValidation(String value) {
    if (value != null && value.isEmpty)
      return 'Name cannot be null';
    else if (value.contains(new RegExp(r'^[0-9]')))
      return 'Name cannot be a number';
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
              // onChanged: (value){
              //   setState(() {
              //     name=value;
              //   });
              // },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
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
              // onChanged: (value){
              //   setState(() {
              //     email=value;
              //   });
              // },
            ),
          ),
        ),

        //for password

        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: TextFormField(
              obscureText: secure,
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
                    secure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      secure = !secure;
                    });
                  },
                ),
              ),
              validator: passwordValidation,
              // onChanged: (value){
              //   setState(() {
              //     password=value;
              //   });
              // },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
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
                    secure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      secure = !secure;
                    });
                  },
                ),
              ),
              validator: confirmpassword,
              // onChanged: (value){
              //   setState(() {
              //     password=value;
              //   });
              // },
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
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Successful')));
                  }
                },
                child: Text('SignUp'),
              )),
        ),
      ]),
    );
  }
}
