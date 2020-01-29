import 'dart:io';

class Shopping{

  int no_of_queues;
  var queues=List();
  int max=999999;
  int position;

  int sort_queue(int no_of_queues, var queues){
    int max=999999;
    int position;
    print('Press ENTRY to get into the line, EXIT to leave');
    String response;
    response=stdin.readLineSync();
    if(response=='EXIT'){
      return 0;
    }
    else{
      for(int index=0;index<no_of_queues;index++){
        if(max>queues[index]){
          max=queues[index];
          position=index;
        }
      }
      print('Shivam must go in the queue no ${position+1}');
      queues[position]+=1;
      sort_queue(no_of_queues, queues);
    }
  }

}