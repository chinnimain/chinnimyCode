trigger taskTriggger on Task (after insert,after delete,after undelete) {
          Set<Id>AccountSet= new Set<Id>();
        if(Trigger.isinsert&&trigger.isundelete){
          
          for(Task taskObj : Trigger.new){
               
             if(taskObj.WhatId!=null&&String.valueof(taskObj.WhatId).startsWith('001')){
             
                   AccountSet.add(taskObj.WhatId);
             }
             
          }
          
          if(!AccountSet.isEmpty()){
            for(Account accObj: [SELECT  (SELECT Id from Tasks) from Account WHERE Id in :AccountSet]){
            
                 //accObj.taskcount=accObj.tasks.size();
            
            }
             
             }
             }
             
            if(trigger.isDelete){
                 
             for(Task taskObj : Trigger.old){
               
             if(taskObj.WhatId!=null&&String.valueof(taskObj.WhatId).startsWith('001')){
             
                   AccountSet.add(taskObj.WhatId);
             }
             
          }
          
           if(!AccountSet.isEmpty()){
            for(Account accObj: [SELECT  (SELECT Id from Tasks) from Account WHERE Id in :AccountSet]){
            
                 //accObj.taskcount=accObj.tasks.size();
            
            }
             
             }
            }
}