import 'package:billing/customer.dart';

class Booking{
  String name='Sherlock Holmes';
  String email='sherlockisawesome@awesomeness.com';
  String phoneNo='2345668322';
  var customer=Customer();
  void bdetails(){
    print('\tCustomer details:');
    print('\tName: $name');
    print('\tPhoneNo: $phoneNo');
    print('\tEmail Address: $email');
    customer.cdetails();
  }
}