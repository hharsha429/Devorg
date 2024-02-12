({
	doInit : function(component, event, helper) {
        //consloe.log('called the doinit');
        //Get the controller method
		var Con=component.get('c.getContacts');
        
        //Set the aid params
       
        Con.setParams({
            aId:component.get('v.recordId')
        }
        
        );
        
        Con.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var responseval=response.getReturnValue();
           component.set('v.Contacts',responseval);     
            }
           
	});
        
        $A.enqueueAction(Con);
         helper.OppFetch(component); 
    },
    doRedirect : function(component, event, helper) {
        var Even=event.getSource();
        console.log('===='+Even);
       var oppid= Even.get("v.name");
        console.log('------'+oppid);
        var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId":oppid ,
        "slideDevName": "detail"
      
    });
    navEvt.fire();
    }
   
})