global class ObjectOutput {
    public string callscript{get;set;}
    public List<SelectOption> objects {get; set;}
    public List<SelectOption> cobjects {get; set;}
    public List<SelectOption> components {get; set;}
    public List<SObject> records {get; set;}
    public string choosenObject {get; set;}
    public string choosencompo {get; set;}
    public string selectedPage {get; set;}
    public string choosenProfile {get; set;}
    public string choosenCObject {get; set;}
    public List<ApexClass> allList{get;set;}
    public List<ApexComponent> allcomp{get;set;}
    public List<ApexPage> allPages{get;set;}
    public List<Profile> allProfile{get;set;}
    public  Map<Id,string>CObj=new  Map<Id,string>();
    public List<selectoption> allClass{get;set;}
    public List<selectoption> allPage{get;set;}
     public List<selectoption> allProfiles{get;set;}
    public string selectedClass{get;set;}
    public string searrched{get;set;}
    public boolean controlSearch{get;set;}
    public boolean controlSearchR{get;set;}
    public string selectedtrigger{get;set;} 
    public string s1{get;set;} 
     public List<SelectOption> Triggers {get; set;}
    public List<ApexTrigger> allTriggers{get;set;}
    public  ObjectOutput(){
        //controlSearch=false;
        allList=new List<ApexClass>();
        allcomp=new List<ApexComponent>();
         allPage = new List<SelectOption>();
        objects = new List<SelectOption>();
        allProfiles = new List<SelectOption>();
        allProfile=new list<profile>();
        cobjects = new List<SelectOption>();
        records = new List<SObject>();
        allClass=new List<selectoption>();
        Triggers = new List<SelectOption>();
         components = new List<SelectOption>();
        allTriggers=new List<ApexTrigger>();
        allPages=new List<ApexPage>();
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        List<String> objectList = new List<String>();
        objectList.addAll(gd.keyset());
        allProfile=[select id,name from Profile];
        allPages=[Select Id, Name from ApexPage];
        allcomp=[Select Id, Name from ApexComponent];
        //allcomp.sort();
        allProfile.sort();
        //allPages.sort();
         allPage.add(new selectOption('--None--','--None--'));
         for(ApexPage p:allPages)
        {
            
            allPage.add(new selectoption(p.name,p.name));
        }
        components.add(new selectOption('--None--','--None--'));
         for(ApexComponent p:allcomp)
        {
            
            components.add(new selectoption(p.name,p.name));
        }
        for(Profile s:allProfile)
        {
            
            allProfiles.add(new selectoption(s.name,s.name));
        }
        allList=[select name from ApexClass];// classes
        //allList.sort();
       
        //objects.sort();
        allClass.add(new selectOption('--None--','--None--'));
        for(ApexClass s:allList)
        {
            
            allClass.add(new selectoption(s.name,s.name));
        }
         Triggers.add(new selectOption('--None--','--None--'));
         allTriggers=[select name from ApexTrigger];// Triggers
        //allTriggers.sort();

        
         for(ApexTrigger s:allTriggers)
        {
           
            Triggers.add(new selectoption(s.name,s.name));
        }
        Schema.DescribeSobjectResult[] results = Schema.describeSObjects(objectList );
        objects.add(new selectOption('--None--','--None--'));
        cobjects.add(new selectOption('--None--','--None--'));
        for(Schema.DescribeSobjectResult res : results) { 
            
            if(res.isCustom() ) {
                
                cobjects.add(new selectOption(res.getLabel(),res.getLabel())); 
                 //cobjects.remove(Visualforce Page);
                 cobjects.sort();
            }else
                objects.add(new selectOption(res.getLabel(),res.getLabel()));
             objects.sort();
             
        }
        system.debug('cobjects >>> '+cobjects);
        choosenCObject = '--None--';
    }
    
    
    
    
    
    
    public pagereference redirect()
    { 
        
        String developerName = choosenObject.replace(' ','_');
        // if(choosenObject!='--None--')
        System.debug('redirect' +choosenObject);
        // System.debug('redirect' +developerName);
        EntityDefinition definition = [
            SELECT DurableId, DetailUrl FROM EntityDefinition
            WHERE DeveloperName =:developerName];
        string s1='' + definition.DurableId;       
        System.debug('lllllll'+definition);
        //redirectToNewPage();
        PageReference pageRef= new PageReference('/'+s1);
        pageRef.setredirect(true);
        //callscript=redirectToNewPage();
        return pageRef;
        
        
        
    }
    
  
    public pagereference redirectStd()
    { 
        //String developerName = choosenObject;
        //developerName=developerName.replaceAll( '\\s+', '');
        System.debug('redirect' +choosenCObject);
        EntityDefinition definition = [
            SELECT DurableId, DetailUrl FROM EntityDefinition
            WHERE DeveloperName =:choosenCObject];    
        PageReference pageRef= new PageReference('/ui/setup/Setup?setupid='+choosenCObject);
         System.debug('redirect--------' +pageRef);
        pageRef.setredirect(false);
        return pageRef;
        
        
        
    } 
    
    public pagereference Classredirect()
    { 
        System.debug('redirect' +selectedClass);
        ApexClass  Apcls = [
            SELECT Id,Name FROM ApexClass where Name=:selectedClass];  
        string s='' + Apcls.Id;
        System.debug('redirect' +s);
        //System.debug('Apcls'  +Apcls.size());
        PageReference pageRef= new PageReference('/'+s);
        pageRef.setredirect(true);
        
        return pageRef;
        
        
        
    } 
     public pagereference profileredirect()
    { 
        System.debug('redirect' +selectedClass);
        Profile  Apcls = [
            SELECT Id,Name FROM Profile where Name=:choosenProfile];  
        string s='' + Apcls.Id;
        System.debug('redirect' +s);
        //System.debug('Apcls'  +Apcls.size());
        PageReference pageRef= new PageReference('/'+s);
        pageRef.setredirect(true);
        
        return pageRef;
        
        
        
    } 
    public pagereference triggerredirect()
    { 
        System.debug('redirect' +selectedClass);
        ApexTrigger  Apcls = [
            SELECT Id,Name FROM ApexTrigger where Name=:selectedtrigger];  
        string s='' + Apcls.Id;
        System.debug('redirect' +s);
        //System.debug('Apcls'  +Apcls.size());
        PageReference pageRef= new PageReference('/'+s);
        pageRef.setredirect(true);
        
        return pageRef;
        
        
        
    } 
    
    public pagereference PageRedirect()
    { 
        //String developerName = choosenObject;
        //developerName=developerName.replaceAll( '\\s+', '');
        System.debug('redirect' +choosenCObject);
        ApexPage Pages = [
            SELECT Id, Name FROM ApexPage Where Name=:selectedPage];  
         string s='' + Pages.Id;
        PageReference pageRef= new PageReference('/'+s);
         System.debug('redirect--------' +pageRef);
        pageRef.setredirect(false);
        return pageRef;
        
        
        
    } 
    public pagereference CompRedirect()
    { 
        //String developerName = choosenObject;
        //developerName=developerName.replaceAll( '\\s+', '');
        System.debug('redirect' +choosenCObject);
        ApexComponent  compo = [
            SELECT Id, Name FROM ApexComponent  Where Name=:choosencompo];  
         string s='' + compo.Id;
        PageReference pageRef= new PageReference('/'+s);
         System.debug('redirect--------' +pageRef);
        pageRef.setredirect(false);
        return pageRef;
        
        
        
    } 
    
    
   
   
  
    
}