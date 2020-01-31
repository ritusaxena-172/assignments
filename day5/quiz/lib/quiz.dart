import 'dart:io';
import 'dart:math';

class QuizGame{
  int r;

  void generateNo(country,capital){
  Random random=Random();
  r=random.nextInt(9);
  print('');
  print('');
  print('Enter the capital of ${country[r]}');
  String cap=stdin.readLineSync();
  if(cap.toUpperCase()==capital[r]){
    print('Correct Answer');
  }
  else{
    print('Incorrect answer.');
  }
  }
}