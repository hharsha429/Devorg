public class first {
    public list<account> acc{set;get;}
    public first(){
        
        acc=new list<account>();
        acc=[select id,name,industry,phone from account];
        
    }

}