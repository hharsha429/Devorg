public class Doctorautopopulate {
    public doctor__c doc{get;set;}
    public patient__c pat{get;set;}
 
    public  Doctorautopopulate() {
    
     pat=new patient__c();   
    
    }
    
    public void fetc(){
        
        doc=[select id,Name,Department__c,Designation__c from Doctor__c where id=:pat.Doctor__c];
        doc.Name=doc.Name;
        doc.harsha1__Department__c=doc.harsha1__Department__c;
        doc.harsha1__Designation__c=doc.harsha1__Designation__c;
        
    }
    
    
}