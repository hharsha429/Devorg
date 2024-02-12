@istest
private class PatientTest {
    Static testmethod void testme(){
        patient__c pat =new patient__c(Patient_Name__c='test123',Age__c=18);
        insert pat;
        PatientCheck.PatientWrapper p =new  PatientCheck.PatientWrapper(pat);
    
        PatientCheck pp =new PatientCheck();
        pp.del();
        pp.processSelected();
    }

}