import 'dart:io';

class UberApp
{
  int fare;

  int calculateFare(int km, int taxi_type){
    int remaining;
    if(taxi_type==40){
      if(km<=20){
        fare=km*40;
        stdout.write('Fare is');
        print(fare);
      }
      else{
        remaining=km-20;
        fare=40+remaining*10;
        stdout.write('Fare is');
        print(fare);
      }
      return fare;
    }
    else{
      if(km<=20){
        fare=km*30;
        stdout.write('Fare is');
        print(fare);
      }
      else{
        remaining=km-20;
        fare=30+15+15*km~/80+15*remaining;
        stdout.write('Fare is');
        print(fare);
      }
      return fare;
    }
  }
}
