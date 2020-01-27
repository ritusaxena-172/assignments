class Product{

  String name;
  int price;
  int discount;
  double actual;
  Product(name, price, discount){
    this.name=name;
    this.price=price;
    this.discount=discount;
  }
  void calc()
  {
    actual=price-price*10/100;
  }
  void prints(){
    print(name);
    print(price);
    print(discount);
    print(actual);

  }
}
