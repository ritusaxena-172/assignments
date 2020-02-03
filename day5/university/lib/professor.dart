import 'package:university/person.dart';

import 'university.dart';

class Professor implements Person, University{
  String kSalary;
  String kCourse;

  @override
  String kEmailId;

  @override
  String kName;

  @override
  String kPhoneNo;

  @override
  List<String> kUniversityName;

  @override
  String kCity;

  @override
  String kCountry;

  @override
  int kPostalCode;

  @override
  String kState;

  @override
  int kStreet;

  
  void pdetails(){
  print('\tName: Sherlock Holmes');
  print('\tPhone No: 2323672811');
  print('\tEmail: sherlockisawesome@awesomeness.com');
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

}