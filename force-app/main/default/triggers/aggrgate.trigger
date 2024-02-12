trigger aggrgate on Account (after insert,after update)
 {
 integer count;
set<id> aid=trigger.newmap.keyset();
list<contact>con=new list<contact>();
for(AggregateResult ar:[SELECT AccountId AcctId,count(id)sl from contact where accountid=:aid Group By AccountId]){
count=(integer)ar.get('sl');
}
for(contact v:[select id,name,Amount__c,accountid from contact where accountid=:aid]){
v.Amount__c=trigger.newmap.get(v.accountid).Total_Amount__c/count;
con.add(v);
}
update con;
}