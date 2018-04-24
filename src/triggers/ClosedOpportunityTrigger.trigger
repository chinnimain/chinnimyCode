trigger ClosedOpportunityTrigger on Opportunity (after insert ,after Update) {

  List<Task>taskList=new List<Task>();
  for(Opportunity oppObj :Trigger.New){
  
      if(oppObj.StageName =='Closed Won'){
         taskList.add(new Task(whatId=oppObj.Id,Subject='Follow Up Test Task'));
         }
  
  }

 if(!taskList.isEmpty()){
   insert taskList;
 }
}