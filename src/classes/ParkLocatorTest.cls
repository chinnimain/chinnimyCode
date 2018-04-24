@istest
class ParkLocatorTest {

  @istest
  static void testmethod1(){
  
      Test.setMock(WebServiceMock.class, new ParkServiceMock());
     string[] checkresult= new string[]{'test'};
     
     System.assertequals(checkresult,ParkLocator.country('india'));
  }

}