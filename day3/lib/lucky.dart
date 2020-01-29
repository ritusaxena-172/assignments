import 'dart:math';

class Lucky {
  int r;
void func2()
{
  Random random = Random();
  r = random.nextInt(9)+1;
switch(r){
  case 1: print('You are awesome');
        break;
  case 2:print('You are fired');
        break;
  case 3:print('You are promoted');
        break;
  case 4:print('You have won a free trip to Paris');
        break;
  case 5:print('You are demoted');
        break;
  case 6:print('You are going to be executed publically');
        break;
  case 7:print('You won \$1,000,000');
        break;
  case 8:print('You are prohibited from accessing internet');
        break;
  case 9:print('You have received free pizza');
        break;
  case 10:print('You are deprived of citizenship under CAA');
}
}
}