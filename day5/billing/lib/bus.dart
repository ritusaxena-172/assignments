import 'booking.dart';

class Bus extends Booking{
String source, destination;

  void busDetails(source,destination){
    print('\tCongratulations! your bus is booked from $source to $destination');
    print('\tYour seat no is:22F, Bus no:22311');
    print('\tHave a safe journey!!');
  }
}