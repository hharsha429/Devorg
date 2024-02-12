trigger AssignOwner on Opportunity (before insert) {
Map<string,Opportunity> OppMap= new Map<string,Opportunity>();
    
    for(opportunity opp :Trigger.new){
        if(opp.Email__c!= Null){
            OppMap.put(opp.Email__c, opp);
        }
    }
    Map<ID,User> UserMap= new Map<ID,User>([select Id,email from user where email In:OppMap.keySet()]);
    system.debug('===========<<>>'+UserMap.values());
    for(opportunity opp :Trigger.new){
        
        if(opp.Email__c==UserMap.get(opp.Email__c).email){
             system.debug('===========<<>>'+opp.OwnerId);
          opp.OwnerId=  UserMap.get(opp.Email__c).Id;
           
        }
    }
}