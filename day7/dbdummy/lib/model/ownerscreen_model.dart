import 'dart:io';

import 'package:flutter/cupertino.dart';

// TextEditingController petImage = TextEditingController();
// TextEditingController petName = TextEditingController();
// TextEditingController petAge = TextEditingController();
// TextEditingController petBreed = TextEditingController();
// TextEditingController petDescription = TextEditingController();
// bool validateImage = false;
// bool validateName = false;
// bool validateAge = false;
// bool validateBreed = false;
// bool validateDescription = false;
// var image;
// File imagefiles;

import 'package:dbdummy/model/sqflite_model.dart';

TextEditingController petImage = TextEditingController();
TextEditingController petName = TextEditingController();
TextEditingController petAge = TextEditingController();
TextEditingController petBreed = TextEditingController();
TextEditingController petDescription = TextEditingController();
bool validateImage = false;
bool validateName = false;
bool validateAge = false;
bool validateBreed = false;
bool validateDescription = false;
var image;
File imagefiles;
Pet pet;
String uploadedURL;
var clickedImagePath;
List<File> imageList = List();
List<String> imageUrls = List();
