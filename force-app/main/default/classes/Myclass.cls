public class Myclass {
public Map<String,Schema.SObjectType> myType{get;set;}
    public List<ApexClass> allList{Get;set;}
    public List<ApexTrigger> allTrigger{get;set;}
    public List<ApexPage> allPage{get;set;}
    public List<selectoption> allClass{get;set;}
    public List<selectoption> allTrigg{get;set;}
    public List<selectoption> allPages{get;set;}
    public List<selectoption> allObj{get;set;}
    public integer count{get;set;}
    public string selectedPage{get;set;}

    public Myclass()
    {
        count=0;
        myType=Schema.getGlobalDescribe();
        allList=new List<ApexClass>();
        allTrigger=new List<ApexTrigger>();
        allPage=new List<ApexPage>();
        allClass=new List<selectoption>();
        allTrigg=new List<selectoption>();
        allPages=new List<selectoption>();
        allObj=new List<selectoption>();
        selectedPage=null;
           allList=[select name from ApexClass];// classes
        allList.sort();
        for(ApexClass s:allList)
        {
            selectoption v=new selectoption(s.name,s.name);
            allClass.add(v);
        }
         allTrigger=[select name from ApexTrigger];// Triggers
        allTrigger.sort();


         for(ApexTrigger s:allTrigger)
        {
            selectoption v=new selectoption(s.name,s.name);
            allTrigg.add(v);
        }
        set<string> myval=myType.keySet();
        for(String s:myval)
        {
            selectoption v=new selectoption(s,s);
            allObj.add(v);
            allobj.sort();

        }

    } 


     public void Process()
     {

        System.debug('selected class='+selectedPage);
          allPage=[select name from ApexPage where ControllerKey=:selectedPage];//visualforce pages
        for(ApexPage s:allPage)
        {
            selectoption v=new selectoption(s.name,s.name);
            allpages.add(v);
        }

     }
}