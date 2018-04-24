@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {
    
     @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
         String uri = request.requestURI.removeEnd('/contacts');
        String accountID= uri.substring(
          uri.lastIndexOf('/')+1);
        Account result =  [SELECT Id,Name,(SELECT Id,Name From Contacts) FROM Account
                                                WHERE Id = :accountID];
        return result;
    }

}