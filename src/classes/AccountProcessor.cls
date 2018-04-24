public class AccountProcessor {

    @future 
    public static Void countContacts(List<Id>accountIds){
        List<Account>AccounttoUpdate=new List<Account>();
        for(Account accObj :[SELECT Id ,(SELECT Id from Contacts) from Account Where Id in :accountIds]){
            
            if(accObj.contacts.size()!=0){
                accObj.Number_of_Contacts__c =accObj.contacts.size();
                AccounttoUpdate.add(accObj);
                
            }
            
        }
        
        if(!AccounttoUpdate.isEmpty())
            update AccounttoUpdate;
          
        
    }
}