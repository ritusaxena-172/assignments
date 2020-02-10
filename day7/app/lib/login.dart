import 'package:app/main.dart';
import 'package:app/signup.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  var email = TextEditingController();
  var password = TextEditingController();
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child:Expanded(
            flex:1,
            child: Column(
      children: <Widget>[
        Expanded(
            flex:1,
            child:
        Container(
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
            )),),
            Expanded(
            flex:2,
            child:
        Container(
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
                  icon:
                      Icon(Icons.enhanced_encryption, color: Colors.grey[700])),
            )),),
        Expanded(
            flex:1,
            child:Container(
            child:Row(
          children: <Widget>[
            Expanded(
            flex:1,
            child:Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: (){
                  if(email.text=='ritu'&& password.text=='ritu'){
                    print('Login button');
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ),),
            Expanded(
            flex:1,
            child:Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: (){
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                    );
                },
                child: Text('SignUp'),
              ),
            ))
          ],
        )
        ),
        )
        ],
    )));
  }
}

// class Home extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//           home: Scaffold(
//         appBar: AppBar(centerTitle: true, title: Text('Wanderlust.com'),backgroundColor:Colors.grey[700],),
//               backgroundColor: Colors.grey[200],
//               body:Center(child: RaisedButton(onPressed: (){
//                 Navigator.pop(context);
//               },),)
//               ),
//     );
//   }
  
// }