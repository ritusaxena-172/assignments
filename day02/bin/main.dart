import 'dart:io';

import 'package:product/Registartion.dart';
import 'package:product/Toupper.dart';
import 'package:product/largest.dart';
import 'package:product/table.dart';

import '../lib/product.dart';

void main(List<String> arguments) {
  int j;
  print('Enter the program from 1 to 5');
  j=int.parse(stdin.readLineSync());
  switch(j){

  //1st prog

  case 1:var p = Product('LG',35000,10);
  p.calc();
  p.prints();
  break;

  //2nd prog
  case 2:String name;
  int age;
  String phone;
  String email;
  print('Enter the name');
  name = stdin.readLineSync();
  print('Enter the age');
  age = int.parse(stdin.readLineSync());
  print('Enter the phone number');
  phone = stdin.readLineSync();
  print('Enter the email address');
  email= stdin.readLineSync();
  var r=RegistrationForm(name, age, phone, email);
  r.prints();
  break;

  //3rd prog
  case 3:String s;
  print('Enter the string');
  s=stdin.readLineSync();
  var t=Toupper(s);
  t.toupper();
  break;

  //4th prog
  case 4:int n;
  print('Enter the number');
  n=int.parse(stdin.readLineSync());
  table(n);
  break;

  //5th prog
  case 5:int n;
  print('Enter the number');
  n=int.parse(stdin.readLineSync());
  large(n);
  break;
  }
}
