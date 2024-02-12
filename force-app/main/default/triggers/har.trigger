trigger har on Contact (after update) {
set<id> aid=new set<id>();

                           for(contact c:trigger.new)
                           {
                              aid.add(c.AccountId);
                           }

                          List<Account> AccountData=new List<Account>();

                          for(contact c:trigger.new)
                         {
                              if(aid.contains(c.AccountId))
                              {
                                   if(c.Amount__c>=35)
                                   {
                                         Account a=new Account(id=c.AccountId);
                                         a.result__c='Pass';
                                         AccountData.add(a);
                                   }
                              
                            if (c.Amount__c<35)
                            {
                            Account a=new Account(id=c.AccountId); 
                            a.result__c='fail';
                            AccountData.add(a);
                          }
                          }
}
                          update AccountData;


}