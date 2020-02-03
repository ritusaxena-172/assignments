import 'package:hospital/services.dart';

import 'doctor.dart';

class Patient{
  int pid=123;
  String pname='John Meyer';
  var doctor=Doctor();
  var service=Services();
  void getappointment(int index){
    print('\tWelcome $pname of customer id $pid to Apollo Hospital');
    doctor.privateDetails(service,index);
  }
}