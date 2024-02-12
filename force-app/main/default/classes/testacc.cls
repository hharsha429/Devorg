public class testacc {
    
    public list<account> acc1{set;get;}  
    public testacc(){
        acc1=new list<account>();
        acc1=[select id,name,phone from account];
    }

    
}