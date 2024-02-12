public class ContactWraper {
    public list<conwrap>cn{set;get;}
    public list<contact>cont{set;get;}
    public list<contact>cota{set;get;}
    public contactWraper(){
        cn=new list<conwrap>();
        cont=new list<contact>();
        cota=new list<contact>();
        cont=[select id,lastname,phone from contact];
        for(contact c:cont){
           cn.add(new conwrap(c,false)); 
           
        }
    
       

        }  
        

    

    public PageReference pag(){
        cota.clear();
                    for(conwrap d:cn){
            if(d.test==true){
                 
                   cota.add(d.con);            
                 }
            }  
        PageReference p = new PageReference('/apex/contactWraper1');
        return p;
        
    }
    
    
    
    
    
    
    
    
    public class conwrap{
        public contact  con{get;set;}
        public boolean test{get;set;}
        public conwrap(contact con,boolean test){
            this.con=con;
            this.test=test;
        }
        
    }
}