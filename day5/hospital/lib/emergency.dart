import 'package:hospital/services.dart';

class Emergency extends Services{
  String type='Emergency';

  void details(){
    print('\tFor $type Service');
  }
}