import 'dart:io';

import 'package:day4/bill.dart';
import 'package:day4/day4.dart' as day4;
import 'package:day4/shoppig.dart';
import 'package:test/test.dart';

import '../lib/day4.dart';

void main(List<String> arguments) {
  int choice;
  print('Enter the program number from 1 to 3');
  choice=int.parse(stdin.readLineSync());
  switch(choice){

    //1st prog
    case 1:List<int> unsorted_list=List();
          int list_length,index;
          print('Enter the number of elements to be sorted');
          list_length=int.parse(stdin.readLineSync());
          print('Enter the $list_length numbers to be sorted');
          for(index=0;index<list_length;index++){
            unsorted_list.add(int.parse(stdin.readLineSync()));
          }
          var obj_To_sort=To_sort();
          List<int> sorted_list=obj_To_sort.sorting(unsorted_list);
          print(sorted_list);
          break;


      //2nd prog
      case 2:print('\t\t\t\t\t------------------WELCOME TO MACY\'S------------------\t\t\t\t\t');
            List <list_items> item_list=[list_items(item_name: "item 1", item_cost: 500),list_items(item_name: "item 2", item_cost:345,),list_items(item_name: "item 3", item_cost:670,),list_items(item_name: "item 4", item_cost:400,)];
            print('Here is the list of items available');
            var obj_logic=Logic();
            int index;
            for(index=0;index<4;index++)
            {
              stdout.write(item_list[index].item_name);
              stdout.write(' ');
              print(item_list[index].item_cost);
            }
            print('Kindly enter the no of items you wish to buy');
            int no_of_items=int.parse(stdin.readLineSync());
            print('Enter the item no from 1 to 4 you want to buy');
            var item_no=List();
            for(index=0;index<no_of_items;index++)
            {
              item_no.add(int.parse(stdin.readLineSync()));
            }
            int indian_amt=0;
            for(index=0;index<no_of_items;index++)
            {
              indian_amt+=item_list[item_no[index]-1].item_cost;
            }
            print('Enter your country name in capital letters');
            String country=stdin.readLineSync();
            print('Your total bil in INR is Rs$indian_amt');
            obj_logic.bill_details(indian_amt,country);
            break;

      case 3:var obj_shopping =Shopping();
            int no_of_queues;
            var queues=List();
            print('Enter the no of queues in the shopping mart');
            no_of_queues=int.parse(stdin.readLineSync());
            print('Enter the no of persons in each $no_of_queues queues');
            for(int index=0;index<no_of_queues;index++)
            {
              queues.add(int.parse(stdin.readLineSync()));
            }
            obj_shopping.sort_queue(no_of_queues,queues);
            
  }
}
