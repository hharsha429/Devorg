public class testprepopulate {
public Account Acc{get; set;}
    public Opportunity Opp{get; set;}
    public testprepopulate(ApexPages.StandardController stdController){
    
      this.acc= (Account)stdController.getRecord();
        acc.Phone = ApexPages.currentPage().getParameters().get('Phone');
        Opp=new Opportunity();
          Opp.accountId= acc.Id;
        acc.Phone=acc.Phone;
      // opp.AccountId = ApexPages.currentPage().getParameters().get('who_id');
    }
    
    public PageReference save() {
    update acc;
   
    insert Opp;
    return null;
}
    
    
}