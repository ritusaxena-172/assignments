import 'package:university/person.dart';

import 'university.dart';

class Student implements Person, University{
  void sdetails(){
  print('\tName: John Watson');
  print('\tPhone No: 2323672231');
  print('\tEmail: johnisawesome@awesomeness.com');
  }

  @override
  void showAddress(String city, List university, uchoice) {
    // TODO: implement showAddress
  }

  @override
  String city;

  @override
  String country;

  @override
  int postalCode;

  @override
  String street;

  @override
  String kEmailId;

  @override
  String kName;

  @override
  String kPhoneNo;
  
  
}