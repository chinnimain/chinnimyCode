public class AddPrimaryContact implements Queueable {
    
    private Contact contactRec;
    private String BillingState ;
    
    public AddPrimaryContact(Contact p_Contact, String state) {
        this.contactRec = p_Contact;
        this.BillingState = state;
    }

    public void execute(QueueableContext context) {
    List<Contact>contactList= New List<Contact>();
    Contact con;
        for(Account accObj :[Select Id from Account Where BillingState =:BillingState]){
        
               con= contactRec.clone();
               con.AccountId=accObj.Id;
               contactList.add(con);
        }
        
       if(!contactList.isEmpty()) 
                  insert contactList;
    }
    
}