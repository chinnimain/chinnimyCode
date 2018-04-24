trigger EventTriggger on Event(after insert,after delete,after undelete) {
          Set<Id>AccountSet= new Set<Id>();
        if(Trigger.isinsert&&trigger.isundelete){
          
          for(Event EventObj : Trigger.new){
               
             if(EventObj.WhatId!=null&&String.valueof(EventObj.WhatId).startsWith('001')){
             
                   AccountSet.add(EventObj.WhatId);
             }
             
          }
          
          if(!AccountSet.isEmpty()){
            for(Account accObj: [SELECT  (SELECT Id from Events) from Account WHERE Id in :AccountSet]){
            
                 //accObj.taskcount=accObj.Events.size();
            
            }
             
             }
             }
             
            if(trigger.isDelete){
                 
             for(Event EventObj : Trigger.old){
               
             if(EventObj.WhatId!=null&&String.valueof(EventObj.WhatId).startsWith('001')){
             
                   AccountSet.add(EventObj.WhatId);
             }
             
          }
          
           if(!AccountSet.isEmpty()){
            for(Account accObj: [SELECT  (SELECT Id from Events) from Account WHERE Id in :AccountSet]){
            
                 //accObj.taskcount=accObj.Events.size();
            
            }
             
             }
            }
}