public class harsha{

public static void test(list<contact> con){
set<id> aid=new set<id>();
for(contact c:con){
aid.add(c.accountid);
}
List<Account> acctsToRollup = new List<Account>();
for(aggregateresult ag: [SELECT AccountId AcctId, Count(id) ContactCount 
                               FROM Contact 
                               WHERE AccountId in: aid group by AccountId]){
account a =new account();
a.id=(id) ag.get('AcctId');
a.No_contacts__c=(integer) ag.get('ContactCount');
acctsToRollup.add(a);
}
update acctsToRollup;

}
}