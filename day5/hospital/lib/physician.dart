import 'package:hospital/services.dart';

class Physician extends Services {
  String type='General physician';

  void details(){
    print('Your $type is');
  }
}