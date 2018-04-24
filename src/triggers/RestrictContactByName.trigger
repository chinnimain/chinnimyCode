trigger RestrictContactByName on Contact (before insert, before update) {
    Set<String>str = new Set<String>();
    //check contacts prior to insert or update for invalid data
    For (Contact c : Trigger.New) {
        if(c.LastName == 'INVALIDNAME') {   //invalidname is invalid
            c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
        }
        
     str.add(c.Lastname);
     
    }

   List<Contact>conList=[SELECT LastName FROM Contact where LastName In :str];
   
     for(Contact con : conList){
        con.LastName = 'changed';
     
     }
     
     update conList;

}