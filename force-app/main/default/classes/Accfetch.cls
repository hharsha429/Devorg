public class Accfetch {
    public list<account> accounts{get;set;}
    
    public Accfetch(){
       accounts=new list<account>();
        accounts=[select id,name,phone,Type from account];
        
        
    }   
}