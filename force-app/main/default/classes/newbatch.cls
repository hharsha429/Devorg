global class newbatch implements Database.Batchable<sobject>
{
global final String Query;
global newbatch(String q)
{
Query=q;
}

global Database.QueryLocator start(Database.BatchableContext BC)
{
return Database.getQueryLocator(query);
}

global void execute(Database.BatchableContext BC,list <account> scope)
{
List <Account> lstaccount = new list<account>();
for(account s : scope)
{
Account a = (Account)s;
lstaccount.add(a);
}
Delete lstAccount;
}

global void finish(Database.BatchableContext BC)
{
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String[] toAddresses = new String[] {'hharsha429@gmail.com'};
mail.setToAddresses(toAddresses);
mail.setSubject('Apex Batch Job is done');
mail.setPlainTextBody('The batch Apex job processed ');
Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
}
}