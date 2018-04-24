@isTest
class DailyLeadProcessorTest{
 static String CRON_EXP = '0 0 0 15 3 ? 2022';

 @isTest static void Testdate(){
 
     List<Lead>leadRecs = AccountData.leadRecs(200,'data');
        
        insert leadRecs;
        Test.Starttest();
         String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new  DailyLeadProcessor());
            
            Test.stopTest();
            
            System.assertEquals(200,[Select Count() from Lead where LeadSource='Dreamforce']);
     
 }

}