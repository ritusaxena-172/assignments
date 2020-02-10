// ListView(
//             padding:EdgeInsets.all(10.0),
//             children: <Widget>[
//             DrawerHeader(
//               child: Text('Movie Title'),
//               decoration:BoxDecoration(
//                 color:Colors.grey
//               ),
//             ),
//             GestureDetector(
//               child: new Card(
//             child: ListTile(leading: new Icon(Icons.looks_one),
//             enabled: true,
//               title:Text('Movie 1'),
//             ),),
//             ),
//             new Card(
//             child:ListTile(leading: new Icon(Icons.looks_two),
//               title:Text('Movie 2'),
//               onTap:(){
//                 setState(() {
                  
//                 });
//                  Navigator.pop(context);
//               },
//             ),),
//             new Card(
//              child:ListTile(leading: new Icon(Icons.looks_3),
//               title:Text('Movie 3'),
//               onTap:(){
                
//                  Navigator.pop(context);
//               },
//             ),)
//           ],