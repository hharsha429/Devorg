public  class GetAccounts {
    @AuraEnabled
    public static List<Account> getListAccounts() {
        try {
            List<Account> Acc = [SELECT Id,Name,Phone,Industry from Account Limit 10];
            return acc;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static void updateRecords(String recordsJson) {
        system.System.debug('recordsJson'+recordsJson);
      try {
        List<Account> kits = (List<Account>) JSON.deserialize(
          recordsJson,
          List<Account>.class
        );
  
        update kits;
      } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
      }
    }
    
    @AuraEnabled
    public static List<Contact> getContacts(String AccountId) {
        List<Contact> Con = [SELECT Id,LastName,Phone,Email from Contact WHERE AccountId =:AccountId];
        return Con;
     
    }
    @AuraEnabled
    public static void updateConRecords(String recordsJson) {
        system.System.debug('recordsJson'+recordsJson);
      try {
        List<Contact> Con = (List<Contact>) JSON.deserialize(
          recordsJson,
          List<Contact>.class
        );
  
        update Con;
      } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
      }
    }
    @AuraEnabled
    public static List<Account> getAcc(String sName) {
        String tempInput ='%' + sName  + '%';

        List<Account> Acc = [SELECT Id,Name,Industry from Account WHERE Name Like :tempInput];
        system.System.debug('Acc=====>'+sName);
        return Acc;
     
    }
}