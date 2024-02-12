@istest
public class TestWraper {
    static testmethod void exp(){
        account a =new account();
        a.Name='harsha';
        a.Phone='993900912029';
        insert a;
        //ApexPages.StandardController sc = new Apexpages.StandardController(a);
         AccountClass w=new  AccountClass();
        //w.accountList.get(0).selected=true;
        w.getAccounts();//select the first item using the getter
        
   
        
        
        
    }
}