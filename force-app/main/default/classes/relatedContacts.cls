public class relatedContacts {
@AuraEnabled
    Public static List<contact> getContacts(String aId){
        
     List<contact> contacts=[SELECT Id,LastName,phone,email FROM Contact WHERE AccountId=:aId];
        system.debug('==='+contacts);
        return contacts;
    }
    
    @AuraEnabled
    Public static List<opportunity> getOpportun(String Accid){
        
     List<opportunity> Opp=[SELECT Id,Name,StageName,type FROM opportunity WHERE AccountId=:Accid];
        system.debug('==='+Opp);
        return Opp;
    }
}