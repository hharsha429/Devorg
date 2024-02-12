@istest
private class Testcount {
    static testMethod void sMethod(){
        
        account a=new account();
        a.name='harsha';
        insert a;
        contact c=new contact();
        c.accountid=a.Id;
        c.LastName='vardhan';
        insert c;
        contact c1=new contact();
        c1.accountid=a.Id;
        c1.LastName='vardhan';
        insert c1;
        contact c2=new contact();
        c2.accountid=a.Id;
        c2.LastName='vardhan';
        insert c2;
        
    }

}