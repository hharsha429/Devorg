public class OnlickOpportunityButton {
    Public Account acc {set;get;}
    public Opportunity opt {set;get;}
    
    
    public  OnlickOpportunityButton() {
        acc=new Account();
        opt=new Opportunity();
    }
    public void InsertMe() {
    opt=[SELECT Id,AccountId,Amount,StageName,Type from Opportunity WHERE AccountId =:acc.Id]; 
        insert opt;
    }
}