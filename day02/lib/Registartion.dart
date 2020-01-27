
class RegistrationForm{
  String name;
  int age;
  String email;
  String phone;

  RegistrationForm(name, age, email, phone){
    this.name=name;
    this.age=age;
    this.email=email;
    this.phone=phone;
  }
  void prints(){
    print('Name is $name');
    print('Age is $age');
    print('Phone number is $phone');
    print('Email address is $email');
  }
}