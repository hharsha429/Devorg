@istest
public class firsttest {
    //@istest
 public static testMethod void testme(){
    account a=new account(name='test',Industry='Banking',phone='123456789');
        insert a;
     string str='select id,name,industry,phone from account';
     test.startTest();
     first f=new first();
     account aa=[select id,name,industry,phone from account where id=:a.id];
     system.assertEquals('test', aa.name);
     test.stopTest();
    }
    
    
 
    
}