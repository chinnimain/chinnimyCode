@istest
class AnimalLocatorTest {
  @istest
  static void tetsMethod1(){
  
      // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    String animalname = AnimalLocator.getAnimalNameById(1);
  
    System.assertEquals('chicken', animalname );
   
  }

}