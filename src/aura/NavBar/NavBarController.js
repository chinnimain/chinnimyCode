({ createRecord : function (component, event, helper) {
    var createRecordEvent = $A.get("e.force:createRecord");
    alert('print');
    createRecordEvent.setParams({
        "entityApiName": "Contact"
    });
    createRecordEvent.fire();
},
	myAction : function(component, event, helper) {
		var navEvent = $A.get("e.c:NavEvent");
        alert('Insurance');
       
    //createRecordEvent.fire();
// Optional: set some data for the event (also known as event shape)
// A parameter’s name must match the name attribute
// of one of the event’s <aura:attribute> tags
navEvent.setParams({ "Tab" : "Account" });
navEvent.fire();
        
	}
   
})