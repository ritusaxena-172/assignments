// class Dog {
//   final int id;
//   final String name;
//   final int age;

//   Dog({this.id, this.name, this.age});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'age': age,
//     };
//   }
// }

// import 'package:flutter/material.dart';

// class Data {
//   String _image;
//   int _id;
//   String _name;
//   int _age;
//   String _breed;
//   String _description;

//   Data(this._name, this._age, this._breed, this._image, [this._description]);

//   Data.withId(this._id, this._name, this._age, this._image, this._breed,
//       [this._description]);

//   int get id => _id;
//   int get age => _age;
//   String get image => _image;
//   String get name => _name;
//   String get breed => _breed;
//   String get description => _description;

//   set name(String name) {
//     this._name = name;
//   }

//   set age(int age) {
//     this._age = age;
//   }

//   set breed(String breed) {
//     this._breed = breed;
//   }

//   set description(String description) {
//     this._description = description;
//   }

//   set image(String image) {
//     this._image = image;
//   }

//   //Convert data object to map object
//   //flutter to sqlite

//   Map<String, dynamic> tomap() {
//     var map = Map<String, dynamic>();
//     if (id != null) {
//       map['id'] = _id;
//     }
//     map['name'] = _name;
//     map['age'] = _age;
//     map['breed'] = _breed;
//     map['description'] = _description;
//     map['image'] = _image;
//     return map;
//   }

//   //map object to data object
//   //sqlite to flutter

//   Data.fromMapObject(Map<String, dynamic> map) {
//     this._id = map['id'];
//     this._name = map['name'];
//     this._breed = map['breed'];
//     this._age = map['age'];
//     this._description = map['description'];
//     this._image = map['image'];
//   }
// }
