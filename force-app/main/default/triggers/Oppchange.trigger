trigger Oppchange on Opportunity (after insert,after update) {
    set<id> std =new set<id>();
    list<account>acc=new list<account>();
    for(opportunity op:trigger.new){
        std.add(op.accountid);
                
    }

   for(aggregateresult ag:[select AccountId AcctId,sum(amount)amt from opportunity where accountid=:std GROUP BY AccountId ])
    {
    Account a = new Account();
        a.Id = (Id) ag.get('AcctId');
        a.Total_Amount__c=(decimal)ag.get('amt');
        acc.add(a);
    }
    update acc;

}