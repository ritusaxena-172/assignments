import 'package:hospital/emergency.dart';
import 'package:hospital/ent.dart';
import 'package:hospital/physician.dart';

class Doctor implements Emergency, Ent, Physician {
  var doctorList=['Ross Geller','John Watson','Steven Strange'];
  var fee=['200','500','300'];
  @override
  void details() {
    // TODO: implement details
  }

  void doctorDetails(choice){
    print('\tYou are being inspected by Dr. ${doctorList[choice]}');
    print('\tTotal cost is \$${fee[choice]}');
  }

  void privateDetails(service,choice){
    print('\tYour appointment with Dr. ${doctorList[choice]} for ${service.service[choice]} is confirmed');
  }

  @override
  String type;

  @override
  List<String> service;
}