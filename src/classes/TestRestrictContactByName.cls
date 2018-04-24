@istest
class TestRestrictContactByName{

        @isTest static void Testdate(){
          
          Contact ConObj = New Contact(FirstName='Fname',Lastname='Lname', Email='email@gmail.com');
          insert ConObj;
           Contact uConobj =New Contact (Id=ConObj.Id,LastName='INVALIDNAME');
           
           Test.startTest();
           Database.SaveResult result = Database.update(uConobj , false);
           Test.stopTest();

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+uConobj.LastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());

           
        }
           @isTest static void Testdate1(){
          
          Contact ConObj = New Contact(FirstName='Fname',Lastname='INVALIDNAME', Email='email@gmail.com');
         
          
           
           Test.startTest();
           Database.SaveResult result = Database.Insert(ConObj , false);
           Test.stopTest();

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+Conobj.LastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());

           
        }
}