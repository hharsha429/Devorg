public class PatientWrapper {
    public Patient__c pp{set;get;}
    public boolean ischn{set;get;}
    public PatientWrapper(Patient__c p,boolean isch){
        pp= p;
       ischn=isch;
    }

}