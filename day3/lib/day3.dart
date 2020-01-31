import 'dart:math';

class Coin_flip{
  int r;
  void func(){
    Random random = Random();
    r = random.nextInt(2)+1;

    switch(r){
      case 1: print('head');
            break;
      case 2:print('tail');
            break;
    }
  }
}