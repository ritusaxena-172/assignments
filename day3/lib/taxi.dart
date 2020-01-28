import 'dart:io';

int online(d){
  int fare,k;
  print('Online Taxi');
  if(d<=20)
  {
    fare=d*40;
    print('Fare is');
    print('40');
  }
  else{
    k=d-20;
    fare=40+k*10;
    print('Fare is');
    print(fare);
  }
  return fare;
  }

  int classic(d){
  int fare,k;
  print('Classic Taxi');
  if(d<=20)
  {
    fare=d*30;
    print('Fare is');
    print('30');
  }
  else{
    k=d-20;
    fare=30+15+15*d~/80+15*k;
    print('Fare is');
    print(fare);
  }
  return fare;
}
void taxi(int d){
  int i,cl;
  i=online(d);
  cl=classic(d);
  if(i<cl||i==cl)
  {
    print('Online Taxi is booked with the fare of \$$i');
  }
  else
  {
    print('Classic taxi is booked with the fare of \$$cl');
  }
  
}
  
  