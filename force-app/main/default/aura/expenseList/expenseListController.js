({
	update: function(component, evt, helper) {
        var expense = component.get("v.expense");
        //If you’re using a namespace, use e.myNamespace:updateExpenseItem instead
        var updateEvent = $A.get("e.c:updateExpenseItem");
        
        //Set the expense data on the event and fire it
        updateEvent.setParams({ "expense": expense }).fire();
    }
})