({
	  getEmprecs : function(component, event, helper) {
         component.set('v.Fields', [
            {label: 'Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
            {label: 'Phone', fieldName: 'harsha1__Phone__c', type: 'Number'},
            {label: 'Preferred Location', fieldName: 'harsha1__Preferred_Location__c', type: 'text'},
            {label: 'Primary Skill', fieldName: 'harsha1__Primary_Skill__c', type: 'text'},
            {label: 'Relevant Experience', fieldName: 'harsha1__Relevant_Experience__c', type: 'text'},
            {label: 'Total Experience ', fieldName: 'harsha1__Total_Experience__c', type: 'text'},
            
            
        ]);
        var action = component.get("c.fetchEmp");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var records =response.getReturnValue();
                records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });
                component.set("v.EmpList", records);
            }
        });
        $A.enqueueAction(action);
    }
})