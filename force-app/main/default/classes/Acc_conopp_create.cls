public class Acc_conopp_create
{
    public account acc {get;set;}
    public list<wrapclass>waAccList{get;set;}
    public contact con {get;set;}
     public opportunity opp {get;set;}
    public Acc_conopp_create(){
     acc = new account();
     con = new  contact();
     opp=new opportunity();
    }
    public pagereference save()
    {
       
          Insert acc;
          con.accountId = acc.id;
          Insert con;
          opp.accountId = acc.id;
          insert opp;
         //Pagereference pg = new Pagereference('/'+acc.id);
       //pg.setredirect(true);
      return null;
      return null;
      
    }
    Public void addAccount()
{
Account acc2 = new Account();
contact c2=new contact();
opportunity o=new opportunity();
}
   public void cancel(){}
   public class wrapclass{
public account acc1{get;set;}
public contact con1{get;set;}
public opportunity opp1{get;set;}
}
}