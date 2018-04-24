@isTest
public class AddPrimaryContactTest{



   @isTest static void Testdate(){
   
           List<Account>NYAccounts = AccountData.accountRecs(50,'NY');
           List<Account>CAAccounts = AccountData.accountRecs(50,'CA');
           insert NYAccounts ;
           insert CAAccounts ;
           Contact ConObj = New Contact(FirstName='fname',LastName='lName',email='fname@Test.com');
           Test.startTest();
             ID jobID = System.enqueueJob(New AddPrimaryContact(ConObj,'CA'));

           Test.stopTest();
           
           System.assertEquals(50,[Select Count() from Contact]);
           
           
   }
   
   
   @isTest static void Testdate1(){
   
           List<Account>NYAccounts = AccountData.accountRecs(50,'NY');
           List<Account>CAAccounts = AccountData.accountRecs(50,'CA');
           insert NYAccounts ;
           insert CAAccounts ;
           Contact ConObj = New Contact(FirstName='fname',LastName='lName',email='fname@Test.com');
           Test.startTest();
             ID jobID = System.enqueueJob(New AddPrimaryContact(ConObj,'MA'));

           Test.stopTest();
           
           System.assertEquals(0,[Select Count() from Contact]);
           
           
   }



}