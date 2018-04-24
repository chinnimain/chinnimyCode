({
	handleApplicationEvent : function(component, event, helper) {
        console.log('inside create Up');
        var tab = event.getParam("Tab");
   console.log('inside create Up');
        var divCmp = component.find("MainDiv");
          var createRecordEvent = $A.get("e.force:createRecord");
    alert('print');
   /* createRecordEvent.setParams({
        "entityApiName": "Contact"
    });
        createRecordEvent.fire();
        */
	 $A.createComponent("force:recordView",
                {
                    "recordId" :"0014100000HDZKw",
                     "type":"MINI"          
                }, 
                 function(newTB,status, errorMessage){
                     console.log('inside create');
                   var body = component.get("v.body");
                   body.push(newTB);
                     debugger;
                   component.set("v.body", body);
                });
                
	},
    init:function(component,event,helper){
        alert('boday Comp loaded');
        
    }
})