class Customer{
  String street='221B Baker Street';
  String city='London';
  String country='UK';
  int postalCode=122333;

  void cdetails(){
    print('\tThe address of the customer is');
    print('\t$street, $city, $country, $postalCode');
  }
  
}