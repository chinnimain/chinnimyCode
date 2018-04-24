@isTest 

private class AccountManagerTest{

  @isTest static void testAccountManager() {

      
       Account acc = New Account(Name='ChinniAccount');
       
       insert acc;
       
       System.assertNotEquals(acc.Id,null);
       
       Contact con = new Contact(LastName='Test',FirstName='Test',AccountId=acc.Id);
       
       insert con;
       System.assertNotEquals(con.Id,null);
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.salesforce.com/services/apexrest/Accounts/'
            + acc.Id;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Test', thisAccount.Contacts[0].Name);
   
       
       
  }
}