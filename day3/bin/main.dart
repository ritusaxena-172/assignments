import 'dart:io';

import 'package:day3/choco.dart';
import 'package:day3/lucky.dart';
import 'package:day3/nandini.dart';
import 'package:day3/taxi.dart';
import 'package:day3/tic.dart';

import '../lib/day3.dart';

void main(List<String> arguments) {
  int choice;
  print('Enter the program from 1 to 6');
  choice=int.parse(stdin.readLineSync());
  switch(choice){

  //1st prog
  case 1:print('-------Welcome to Uber App--------');
        print('Enter the distance to be covered in km');
        int km;
        km=int.parse(stdin.readLineSync());
        taxi(km);
        break;

  //2nd prog
  case 2:int chocolates;
        print('Enter the no of chocolates in the packet');
        chocolates=int.parse(stdin.readLineSync());
        choco(chocolates);
        break;

  //3rd prog
  case 3:func();
        break;

  //4th prog 
  case 4:print('\t\t\t\t\t------------------Tic Tac Toe----------------');
          tictac();
          break;
  
  //5th prog
  case 5:func2();
        break;

  case 6:int milk_classes,order_milk,spoiled_milk;
        List<int> milk_packets=List();
        print('Enter the order given by customer');
        order_milk=int.parse(stdin.readLineSync());
        print('Enter the no of classes of milk');
        milk_classes=int.parse(stdin.readLineSync());
        print('Enter the count of each class');
        int count;
        for(count=0;count<milk_classes;count++){
        print('Class $count');
        //milk_packets[count]=int.parse(stdin.readLineSync());
        milk_packets.add(int.parse(stdin.readLineSync()));
        }
        print('Enter the spoiled milk');
        spoiled_milk=int.parse(stdin.readLineSync());
        nandini_milk(milk_classes,milk_packets,spoiled_milk,order_milk);
        break;

  }
}
