public class AccountData{

       public static List<Account> accountRecs(integer recs,string State){
         list<Account>accList=new List<Account>();
                for(integer i=1;i<=recs;i++){
                
                      accList.add(new Account(Name=State+i,BillingState=State));
                
                }
                
                return accList;
       
       }

       public static List<Lead> leadRecs(integer recs,string lname){
         list<Lead>leadList=new List<Lead>();
                for(integer i=1;i<=recs;i++){
                
                      leadList.add(new Lead(Firstname='Lead',LastName=lname+i,Status='Open',Company='Data'));
                
                }
                
                return leadList;
       
       }



}