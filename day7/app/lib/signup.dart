import 'package:flutter/material.dart';

class Signup extends StatefulWidget{
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Signup'),backgroundColor: Colors.grey,),
        body: Formpage(),
        ),

    );
  }
}

class Formpage extends StatefulWidget{
  @override
  _FormpageState createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {

  final formkey=GlobalKey<FormState>();
  //String name;
  var email = TextEditingController();
  var password = TextEditingController();
  String nameValidation(String name){
    if(name != null && name.isEmpty){
      return 'Name cannot be null';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key:formkey,
      child: Column(children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: email,
            decoration: InputDecoration(
             // hintText: 'Your stage name!',
             errorText: nameValidation(email.text),
              labelText: 'Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.person, color: Colors.grey),      
            )
            /*validator:(value){
              if(value.isEmpty){
                return 'Name cannot be empty';
              }
              else if(value.contains('[0-9]'))
                {
                  return 'Name cannot be numeric';
                }
                else return null;
            },*/
          ),
        ),),
        Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              //hintText: 'Your stage name!',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.mail, color: Colors.grey),      
            ),
            validator:(value){
              if(value.isEmpty){
                return 'Name cannot be empty';
              }
              return null;
            },
          ),
        ),),
        Expanded(
        flex: 1,
        child: Container(),),
        Expanded(
        flex: 1,
        child: Container(),),
      ],),);
  }
}