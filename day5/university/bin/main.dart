import 'dart:io';

import 'package:university/branches.dart';
import 'package:university/courses.dart';
import 'package:university/professor.dart';
import 'package:university/student.dart';

void main(List<String> arguments) {
  
  int choice, uchoice, bchoice, cchoice;
  var university=['IIT','NIT','VIT','VTU'];
  var branches=['Delhi','Chennai','Ahmedabad'];
  var obj_branch=Branches();
  var obj_course=Courses();
  var obj_professor=Professor();
  var obj_student=Student();
  print('\tAre you');
  print('\t1. Professor\t 2. Student\t 3. None of these');
  choice=int.parse(stdin.readLineSync());
  if(choice ==1){
    print('\tDo you teach in one of the following universities');
    print('\tIf yes, select an option');
    print('\t1. IIT\t 2. NIT\t 3. VIT\t 4. VTU');
    uchoice=int.parse(stdin.readLineSync());
    obj_branch.branch(university, uchoice-1);
    print('\t1. Delhi\t 2. Chennai\t 3. Ahmedabad');
    bchoice=int.parse(stdin.readLineSync());
    obj_course.courses(branches, bchoice-1);
    print('\t1. MBA\t 2. B.Tech\t 3. MCA\t 4. PhD');
    cchoice=int.parse(stdin.readLineSync());
    print('\tYour details are below:');
    obj_professor.pdetails();
    print('\tThe address of your university is');
    obj_course.showAddress(branches[bchoice-1], university, uchoice-1);
  }
  else if(choice==2){
    print('\tDo you study in one of these Universities?');
    print('\tIf yes, select an option');
    print('\t1. IIT\t 2. NIT\t 3. VIT\t 4. VTU');
    uchoice=int.parse(stdin.readLineSync());
    obj_branch.branch(university, uchoice-1);
    print('\t1. Delhi\t 2. Chennai\t 3. Ahmedabad');
    bchoice=int.parse(stdin.readLineSync());
    obj_course.courses(branches, bchoice-1);
    print('\t1. MBA\t 2. B.Tech\t 3. MCA\t 4. PhD');
    cchoice=int.parse(stdin.readLineSync());
    print('\tYour details are below:');
    obj_student.sdetails();
    print('\tThe address of your university is');
    obj_course.showAddress(branches[bchoice-1], university, uchoice-1);
  }
  else{
    return;
  }
}
