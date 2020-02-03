class Address{
  String street='221B Baker Street';
  String city='London';
  String country='UK';
  int postalCode=122333;

  void showAddress(String city,List university,uchoice){
    print('\tThe address of the customer is');
    print('\t${university[uchoice-1]} University');
    print('\t$street, $city, $country, $postalCode');
  }
}