@isTest
 class TestVerifyDate{
 
   @isTest static void Testdate(){
   
     Date p1_myDate = Date.newInstance(1989, 4, 21);
      Date p2_myDate = Date.newInstance(1989, 4, 21);
      
      System.assertEquals(p2_myDate,VerifyDate.CheckDates(p1_myDate,p2_myDate ));
   }
    @isTest static void Testdate2(){
   
     Date p1_myDate = Date.newInstance(1989, 4, 21);
      Date p2_myDate = Date.newInstance(1989, 5, 22);
      
      System.assertNotEquals(p2_myDate,VerifyDate.CheckDates(p1_myDate,p2_myDate ));
   }
 
 }