@isTest
class AccountProcessorTest{


            @isTest static void Testdate(){
                          Account acc = New Account (Name = 'TestAccount');
                          insert acc;
                          List<Contact>contactList=new List<contact>();
                          contactList.add(new Contact(FirstName='test',LastName='lname1',Email='test@test.com',AccountId=acc.Id));
                          
                          contactList.add(new Contact(FirstName='test',LastName='lname2',Email='test1@test.com',AccountId=acc.Id));
                          insert contactList;
                          
                           test.StartTest();
                           AccountProcessor.countContacts(New List<Id>{acc.Id});
                           test.StopTest();
                          
                         
            
            }
            
}