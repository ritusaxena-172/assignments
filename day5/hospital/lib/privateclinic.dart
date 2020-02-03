import 'doctor.dart';

class PrivateClinic extends Doctor{
  String dname;

   void pgetAppointment(dname){
     print('Your appointment with Dr. $dname is booked');
     print('Fee to be paid is \$600');
   }
}