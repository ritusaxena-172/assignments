class list_items
{
  String item_name;
  int item_cost;

  list_items({this.item_name, this.item_cost});
}

class Logic
{
  int indian_amt;
  int country;
  void bill_details(indian_amt,country)
  {
   if(country=='USA')
   {
              print('Your total bill in US dollar is \$${indian_amt*0.014}');
            }
            else if(country=='CHINA'){
              print('Your total bill in Yuan is ${indian_amt*0.097}');
            }
            else if(country=='INDIA'){
              print('Your total bill in Indian currecy is Rs ${indian_amt}');
            }
            else{
              print('ERROR:Enter the valid country name in capital letters');
            }
  } 
}
