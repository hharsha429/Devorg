@istest
public class acctest {
    static testmethod void har()
    {
               
       
            Account a=new Account();
        a.name='Demo';
        insert a;
         contact c=new contact();
        c.AccountId=a.id;
        c.LastName='update';
        c.phone='112';
        insert c;
       a.phone='990099000';
                update a;


        c.phone=a.phone;
        update c;
       
    }
}