/** Author: Harsha
** Title :wraper class to display list of accounts with checkbox
** Version:34
**/
public class testwrap {
    public list<account>acc{set;get;}
    public list<account>ac{set;get;}
    public list<wraper1>wp{set;get;}
    public testwrap(){
        acc=new list<account>();
         ac=new list<account>();
         wp=new list<wraper1>();
        acc=[select id,name,phone from account];
        for(account b:acc){
            wp.add(new wraper1(b,false));
        }      
    }
    public void selected(){
        for(wraper1 c:wp){
            if(c.chec==true){
                
                ac.add(c.a);
            }
        }
        
    }
    public class wraper1{
        public account a{set;get;}
        public boolean chec{set;get;}
        public wraper1(account a,boolean chec){
            this.a=a;
            this.chec=chec;
        }
        
    }
}