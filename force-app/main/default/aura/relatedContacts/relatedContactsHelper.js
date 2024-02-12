({
	OppFetch : function(component) {
		var Opp=component.get('c.getOpportun');
         Opp.setParams({
            Accid:component.get('v.recordId')
        }
        
        );
         Opp.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var responseval=response.getReturnValue();
           component.set('v.Opportunities',responseval);     
            }
           
	});
        $A.enqueueAction(Opp);  
	}
})