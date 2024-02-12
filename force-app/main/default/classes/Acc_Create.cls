public class Acc_Create {
    public Account_cus__c con{set;get;}
     public account ac{set;get;}
    public  Acc_Create() {
con=new Account_cus__c();
}
    public void save(){
        
        ac=[select id,name,phone from account where id=:ApexPages.currentPage().getParameters().get('id')];
        system.debug('++++++++++++++++++++'+ac);
        Account_cus__c acus=new Account_cus__c();
        acus.Name=ac.name;
        acus.Account_phone__c=ac.phone;
        acus.Account__c=ac.id;
        insert acus;
     /* Pagereference pg = new Pagereference('/' +aucs.id);
      pg.setredirect(true);
      return pg;*/
     // return null;
        
    }
    

}