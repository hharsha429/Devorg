({
	doInit : function(component, event, helper) {
        //Update expense counters
        helper.getExpenses(component);
	},
    
    createExpense : function(component, event, helper) {
        //Validate the amount field
        var amtField = component.find("amount");
        var amt = amtField.get("v.value");
        if (isNaN(amt)||amt==''){
            amtField.setValid("v.value", false);
            amtField.addErrors("v.value", [{message:"Enter an expense amount."}]);
        }
        else {
            amtField.setValid("v.value", true);
            var newExpense = component.get("v.newExpense");
            helper.createExpense(component, newExpense);
        }
	},
    
    updateEvent : function(component, event, helper) {
        //Update the expense record
		helper.upsertExpense(component, event.getParam("expense"));
	}
})