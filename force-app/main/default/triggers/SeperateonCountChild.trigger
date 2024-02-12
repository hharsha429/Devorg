trigger SeperateonCountChild on Account(after insert,after update,after delete) 
{
   set<id> aid=Trigger.newMap.keySet();
   
   List<contact> conList=[select id,name,AccountId from contact where AccountId=:aid];
    
   integer total=conList.size();
    
   System.debug('Total contact size='+total);
    
    List<contact> util=new List<contact>();
  
  for(contact c:conList)
    {
        if(c.AccountId!=null)
        {
           
            integer totalamount=(integer)Trigger.newMap.get(c.AccountId).Total_Amount__c;
            
            System.debug('total amount'+totalamount);
            
            c.Amount__c=totalamount/total;
            
            System.debug('my contact amount'+c.Amount__c);
            
            util.add(c); 
           
        }
    }
    update util;
   
}