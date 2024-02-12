public class Autopopulate {
public Opportunity con {get;set;}
    public Account acc {get;set;}
    public Autopopulate(ApexPages.StandardController controller){
        con = new Opportunity();
   id aid=controller.getRecord().id;
         acc = [SELECT id, name,phone,Sic,harsha1__PinNo__c FROM account WHERE Id = :aid];
        con.AccountId=aid;
        con.harsha1__Phone__c=acc.Phone;
        con.harsha1__Sic__c=acc.Sic;
        con.harsha1__PinNo__c=acc.harsha1__PinNo__c;
    }
    
 
     public Pagereference Save(){
       insert con;
         pagereference p =new pagereference('/'+acc.id);
         return p;
     }

}