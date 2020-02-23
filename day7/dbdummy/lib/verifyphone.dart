import 'package:flutter/material.dart';

class VerifyPhone extends StatefulWidget{
  String phonenumber;
  VerifyPhone(phone){
    phonenumber=phone;
  }
  
  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  String phonenumber;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      ListView(children: <Widget>[
      ListTile(
  leading: Icon(Icons.phone),
  title: TextField(
    decoration: InputDecoration(
        labelText: "Phone Number"
    ),
    keyboardType: TextInputType.phone,
    onChanged: (value) => phonenumber = value,
  ),
),
Row(
  children: <Widget>[
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        child: RaisedButton(
          onPressed: _submit,
          child: Text("Submit", style: TextStyle(fontSize: 15.0, color: Colors.white),),
          color: Color(0xFF18D191),
          elevation: 7.0,
        ),
      ),
    ),
  ],
)
    );
  }
}