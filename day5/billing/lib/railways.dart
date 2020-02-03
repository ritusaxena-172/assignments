import 'booking.dart';

class Railway extends Booking{
  String source, destination;

  void railDetails(source,destination){
    print('\tCongratulations! your train is booked from $source to $destination');
    print('\tYour seat no is:22F, train no:92311');
    print('\tHave a safe journey!!');
  }
}