@isTest
private class LeadProcessorTest{

  @isTest static void Testdate(){
   
     List<Lead> lstLead =   new List<Lead>();
                         
                         for(integer i =1;i<=200;i++){
                          
                            lstLead.add(new Lead(Company = 'JohnMiller', LastName = 'Mike'+i, Status = 'Open'));
                         } 
        insert lstLead;
      Test.startTest();         
      LeadProcessor lp=new LeadProcessor();
        Database.executeBatch(lp);
      Test.stopTest();
      
      System.assertEquals(200,[SELECT Count() from Lead]);

   }

}