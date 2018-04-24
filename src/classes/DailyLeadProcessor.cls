public class DailyLeadProcessor implements Schedulable{

    public void execute(SchedulableContext ctx) {
        List<Lead>LeadList =new LIst<Lead>();
        
        
        
                    for(Lead leadObj : [SELECT LeadSource From Lead where LeadSource='' limit 200 ]){
                          
                           leadObj.LeadSource ='Dreamforce';
                        LeadList.add(leadObj);
                    }
                    
                    if(!LeadList.isEmpty()){
                          
                              update LeadList;
        }
    }

}