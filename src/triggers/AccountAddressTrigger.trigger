trigger AccountAddressTrigger on Account (before insert, before update) {

    for(Account accObj : Trigger.New){
    
           if(accObj.Match_Billing_Address__c){
                  accObj.ShippingPostalCode = accObj.BillingPostalCode;
           }
           
    }

}