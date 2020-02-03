import 'dart:io';

import 'package:hospital/hospital.dart' as hospital;
import 'package:hospital/logic.dart';
import 'package:hospital/privateclinic.dart';

import '../lib/hospital.dart';


void main(List<String> arguments) {
  
  int choice, schoice;
  String docname;
  var private=PrivateClinic();
  var hospital=Hospital();
  print('\n\n\n\t\t\t---------------WELCOME TO ${hospital.hname}, ${hospital.hlocation} HOSPITAL---------------\n\n\n');
  print('\tDo you want a:');
  print('\t1. Service from hospital\t 2. See a particular doctor\t\n');
  choice=int.parse(stdin.readLineSync());
  if(choice==1){
    print('\tWhat kind of service? Choose one!');
    print('\t1. Emergency\t 2. ENT\t 3. General Physician');
    schoice=int.parse(stdin.readLineSync());
    logic(schoice);
  }
  else{
    print('\tEnter the doctor you are looking for');
    docname=stdin.readLineSync();
    print('\tSorry doctor $docname is currently not available. You are being directed to his private clinic.');
    private.pgetAppointment(docname);
  }
    
}
