global class clsweb{


   webservice static List<Account> accdat(){
   
   return [select id, name from account limit 20];
   
   }

}