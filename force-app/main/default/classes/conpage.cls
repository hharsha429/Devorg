public class conpage {
    public account acc{get;set;}
    public contact com{get;set;}
    public pagereference next(){
        pagereference p =new pagereference('/apex/conpage');
        p.setRedirect(true);
        return p;
        
    }
      public pagereference next1(){
        pagereference p1 =new pagereference('/apex/Acc_Con_page');
        p1.setRedirect(true);
        return p1;
      }
}