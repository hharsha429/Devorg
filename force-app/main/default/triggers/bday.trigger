trigger bday on Account (after insert,after update) {
set<id> ais=trigger.newmap.keyset();
list<account> acc= new list<account>(); 
list<string>emailid=new list<string>();
list<Messaging.SingleEmailMessage> singleEmailMessageList = new List<Messaging.SingleEmailMessage>(); 
acc=[select id,name,email__c,Dob__c from account where id in:ais];         
for(account a:acc){
 Date myDate = date.today();
           Integer todayDy = myDate.day();
           Integer todayMon = myDate.month();
           Integer dy =  a.Dob__c.day();
           Integer mon =  a.Dob__c.month();
           if(todayDy == dy && todayMon == mon){
           emailid.add(a.email__c);
           }
           Messaging.SingleEmailMessage m=new Messaging.SingleEmailMessage(); 
           m.setToAddresses(emailid);

m.setSubject('Happy Birthday to u:'+a.name );

m.setPlainTextBody('Hi,' +a.name
+''
+'harsha vardhan wishing u a very Happy Birthday....');
singleEmailMessageList.add(m); 

}

if(singleEmailMessageList != null && singleEmailMessageList.size() > 0)
{
 Messaging.sendEmail(singleEmailMessageList);

}


      



}