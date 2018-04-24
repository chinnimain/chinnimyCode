public class SearchLeadOrContact{

   public string lName{get;set;}
   public string fName{get;set;}
   public string Phone{get;set;}
   public string Email{get;set;}
   public string OppyName{get;set;}
   public string zip{get;set;}
   public date DOB{get;set;}
   public string policy{get;set;}
   public Sobject sObj{get;set;}
   public String selected{get;set;}
   
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT firstname,lastname,phone,email FROM Contact where (firstname = :fName AND Firstname!=null) OR Lastname= :lname OR (Phone=:phone  AND Phone!=null) OR (Email =: email AND Email!=null)]));
            }
            return setCon;
        }
        set;
    }
     public ApexPages.StandardSetController setLead {
        get {
            if(setlead== null) {
                setlead = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT firstname,lastname,phone,email FROM Lead where firstname = :fName OR Lastname= :lname OR Phone=:phone OR Email =: email]));
            }
            return setlead;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List<Contact> getContacts() {
    if(setCon!=null)
        return (List<Contact>) setCon.getRecords();
        else
        return null;
    }

    // Initialize setCon and return a list of records
    public List<lead> getLeads() {
      if(setLead!=null)
        return (List<lead>) setLead.getRecords();
        else return null;
    }
   
   
   public void search(){
   
           setcon=null;
           setlead=null;
   
   }
   
   public void recDetail(){
         System.debug('599999'+selected);
         if(selected!=null ){
         If (selected.contains('003')){
                    sObj = [SELECT FirstName,LastName,Email,Phone from Contact where Id =: selected];
         }else{
                     sObj =  [SELECT FirstName,LastName,Email,Phone from Lead where Id =: selected];
         }
         }
   }

}