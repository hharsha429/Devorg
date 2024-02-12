@istest
public class testharsha {
    public static testMethod void testme(){
    account a=new account(name='test',Industry='Banking');
        insert a;
     string str='select id,name,industry,phone from account';
     test.startTest();
     //harsha h=new harsha();
     account aa=[select id,name,industry from account where id=:a.id];
     system.assertEquals('pl enter valid phone number', 'pl enter valid phone nummber');
     test.stopTest();
    }
    
    

}