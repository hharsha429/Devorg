public class DemoWrapper 
{
  public class wrapper
    {
        public Account acc{get;set;}
        public boolean check{get;set;}
        
        public wrapper(Account acc,boolean check)
        {
            this.acc=acc;
            this.check=check;
        }
    }
    public List<wrapper> wrpList{get;set;}
    public List<Account> accList{get;set;}
    public List<Account> aList{get;set;}
    public boolean checkAll{get;set;}
    
    public DemoWrapper()
    {
        wrpList=new List<wrapper>();
        accList=new List<Account>();
        aList=new List<Account>();
        
        
        accList=[select id,name,industry,rating,type from account ];
        
        for(account a:accList)
        {
            wrpList.add(new wrapper(a,false));
            
        }
    }
    public void selected()
    {
        for(wrapper p:wrpList)
        {
            if(p.check==true)
            {
                aList.add(p.acc);
            }
        }
    }
    public void checkMe()
    {
        
           
        
        if(checkAll==true)
        {
        for(wrapper p:wrpList)
        {
            p.check=true;
        }
        }
         
        else if(checkAll==false)
        {
        for(wrapper p:wrpList)
        {
            p.check=false;
        }
        }
     
        
    }
}