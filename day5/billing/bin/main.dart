import 'dart:io';

import 'package:billing/airplane.dart';
import 'package:billing/booking.dart';
import 'package:billing/bus.dart';
import 'package:billing/railways.dart';


void main(List<String> arguments) {

  String source, destination;
  int choice;
  var obj_flight=Airplane();
  var obj_bus=Bus();
  var obj_train=Railway();
  var obj_book=Booking();
  print('\n\n\n\t\t--------------------WELCOME TO YOUR JOURNEY MAKING--------------------\n\n\n');
  print('\tPlease enter the starting point of the journey');
  source=stdin.readLineSync();
  print('\tPlease enter the destination of the journey');
  destination=stdin.readLineSync();
  print('\tChoose your mode of transportation');
  print('1. Bus\t 2. Train\t 3. Flight');
  choice=int.parse(stdin.readLineSync());
  switch(choice){

    case 1: obj_bus.busDetails(source, destination);
            break;

    case 2: obj_train.railDetails(source, destination);
            break;

    case 3: obj_flight.flightDetails(source, destination);
            break;
  }
  obj_book.bdetails();

}
