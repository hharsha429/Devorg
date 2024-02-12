public class accountpopulate {

 Public Id AId;

    public Account doc{get;set;}
    public Opportunity pat{get;set;}
 
    public  accountpopulate(ApexPages.StandardController stdController) {
     
     pat=new Opportunity();   
    
    }
   
    public void fetc(){
        
        doc=[select id,Name from Account where id=:AId];
        doc.Name=doc.name;
       
        
    }
    
    
}