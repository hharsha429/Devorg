public class Employee_info {
	 @AuraEnabled
    public static List <Employee__c> fetchEmp() {
        
        return [SELECT Id, Name, harsha1__Phone__c, harsha1__Preferred_Location__c,harsha1__Primary_Skill__c,harsha1__Relevant_Experience__c,harsha1__Total_Experience__c FROM harsha1__Employee__c LIMIT 10 ];
        
    }
}