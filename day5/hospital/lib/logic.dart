import 'dart:io';

import 'package:hospital/patient.dart';
import 'package:hospital/physician.dart';
import 'package:hospital/privateclinic.dart';

import 'doctor.dart';
import 'emergency.dart';
import 'ent.dart';

var emergency=Emergency();
var ent=Ent();
var physician=Physician();
var doctor=Doctor();
var patient=Patient();
var private=PrivateClinic();
var response, response1;

void logic(int schoice){
  if(schoice==1){
    emergency.details();
  }
  else if(schoice==2){
    ent.details();
  }
  else{
    physician.details();
  }
  doctor.doctorDetails(schoice-1);
  print('\tDo you want to book the appointment with the doctor? Press Y/N.');
  response=stdin.readLineSync();
  if(response.toUpperCase()=='Y'){
  patient.getappointment(schoice-1);
  }
  else{
    print('\tSorry no other doctor is available at this moment');
    print('\tWould you like to go to Dr. ${doctor.doctorList[schoice-1]}\'s private clinic? Press Y/N.');
    response1=stdin.readLineSync();
    if(response1.toUpperCase()=='Y'){
    private.pgetAppointment(doctor.doctorList[schoice-1]);
    }
    else{
      print('\tThanks for visiting Apollo Hospital!');
      return;
    }
  }
}