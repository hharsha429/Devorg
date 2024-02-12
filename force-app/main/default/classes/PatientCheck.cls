public with sharing class PatientCheck {
    public list<patient__c> acc{set;get;}
    public List<PatientWrapper> wr{set;get;}
   // public string har{set;get;}
    public PatientCheck(){
     acc=new list<Patient__c>();
     wr=new list<PatientWrapper>();   
           For(patient__c pc:[select id,Patient_Name__c,age__c,Name from Patient__c]){
           //PatientWrapper pe=new PatientWrapper(pc);
            wr.add(new PatientWrapper(pc));
           // har=UserInfo.getUserId();
        }
    }
        
    public void processSelected() {
    acc = new List<patient__c>();
 
        for(PatientWrapper wrapAccountObj : wr) {
            if(wrapAccountObj.selected == true) {
                acc.add(wrapAccountObj.p);
            }
        }
    }
    
    
    
    
    
    
    public class PatientWrapper {
        public Patient__c p {set;get;}
        public Boolean selected {get; set;}
    public PatientWrapper(Patient__c p){
        this.p=p;
        selected=false;
    }

}
    public void del() {
        List<patient__c> listEmpForDel = new List<patient__c>(); // list of patients
        List<PatientWrapper> listTempWrapper = new List<PatientWrapper>();//list of wrapper
        for(PatientWrapper w : wr) { // 
            if(w.selected) {
                listEmpForDel.add(w.p);
            } else {
                listTempWrapper.add(w);
            }
        }
        if(listEmpForDel.size() > 0) {
            delete listEmpForDel;
           wr = listTempWrapper;
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Select atleast one employee to delete'));
        }
    }
}