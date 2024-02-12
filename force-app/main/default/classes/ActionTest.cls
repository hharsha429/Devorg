@istest
public class ActionTest {
     static testmethod void harsha(){
         boolean showtxt;
         
    
        
         //
        ActionFunDemo ac=new ActionFunDemo();
        // ac.showtxt=false;
         account acc=new account(name='test',Active__c='Yes');
        insert acc;
            ac.showtxt=false;      
        ac.StatusChanged();
       
        ac.showtxt=true;
    }
}