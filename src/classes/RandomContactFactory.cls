public class RandomContactFactory {

    public Static List<Contact> generateRandomContacts(integer recsCount,String Lname){
        
            List<Contact>contactList = new List<Contact>();

        for(integer var =0; var<recsCount; var++){
            
             contactList.add(new Contact(FirstName='test'+var,LastName=Lname,email='test'+var+'@test.com'));
            
        }        
        return contactList;
    }
}