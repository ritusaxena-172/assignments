import 'booking.dart';

class Airplane extends Booking{
  String source, destination;

  void flightDetails(source,destination){
    print('\tCongratulations! your flight is booked from $source to $destination');
    print('\tYour seat no is:22F, flight no:12311');
    print('\tHave a safe journey!!');
  }
}