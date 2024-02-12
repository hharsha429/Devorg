public class newLightningClass {
     @AuraEnabled
    Public static list<contact>getCon(List<Id> accountIds){
        
        List<Contact> contactList = [SELECT Id, Name, Email, Phone, AccountId FROM Contact WHERE AccountId in :accountIds];
                // Returning the contact list
        return contactList;
    }
        
    }