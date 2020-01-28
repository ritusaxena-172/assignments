import 'dart:io';

void nandini_milk(milk_classes,milk_packets,spoiled_milk,order_milk){
milk_packets.sort();
int count;
for(count=milk_classes-1;count>=0;count--)
{
  stdout.write(milk_packets[count]);
  stdout.write('\t');
  if(milk_packets[count]<order_milk){
  stdout.write('${milk_packets[count]}\t');
  stdout.write('0');
  order_milk=order_milk-milk_packets[count];
  }
  else{
    stdout.write(milk_packets[count]-order_milk);
    stdout.write('\t');
    order_milk=milk_packets[count]-order_milk;
    milk_packets[count]=milk_packets[count]-order_milk;
    stdout.write(milk_packets[count]);
  }
  print('');
}
if(order_milk==0){
  print('Thank You!');
}else{
  print('Sorry, cannot deliver $order_milk items remain');
}
}