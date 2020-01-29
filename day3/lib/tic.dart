
import 'dart:io';

void game(){
  int row,col,index=0;
  var tic= [];
  print('\t\t\t\t------------------Tic Tac Toe----------------\n\n');
  stdout.write('\t ----------------------------------------------------------------------------------------------- ');
  for(row = 0;row < 3;row++)
  {
    tic.add(<int>[0,0,0]);
    print('\t\t');
    stdout.write('\t|');
    for(col = 0;col < 3;col++)
    {
      tic[row][col] = index+col+1;
      stdout.write('\t\t${tic[row][col]}\t\t');
      stdout.write('|');
    }
    print('');
    stdout.write('\t ----------------------------------------------------------------------------------------------- ');
    index+=3;
  }
  print('');
  print('Enter the position');
}