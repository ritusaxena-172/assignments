import 'dart:io';

void large(int n)
{
  int i;
  int num;
  List <int> l=List();
  while(n!=0){
    num=n%10;
    l.add(num);
    n=n~/10;  
  }
  l.sort();
  int out=0;
  for(i=l.length-1;i>=0;i--) {
    out=out*10+l[i];
  }
  print(out);
}