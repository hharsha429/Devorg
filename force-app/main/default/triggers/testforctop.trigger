trigger testforctop on Contact (after update) {
Map<ID, account> parentOpps = new Map<ID, account>();
set<id>sid=new set<id>();
for(contact c:trigger.new){
sid.add(c.accountId);
}
parentOpps = new Map<Id, account>([SELECT id, ctc__c,(SELECT ID,Ctc_incremented__c FROM contacts) FROM account WHERE ID IN :sid]);
for(contact d:trigger.new){
account a=parentOpps.get(d.accountId);
a.ctc__c+=d.Ctc_incremented__c;

}


update parentOpps.values();





}