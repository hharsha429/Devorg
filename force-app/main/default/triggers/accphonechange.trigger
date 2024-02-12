/*************************
 *   Populate  account old phone whenever account phone is changed
 *
 *************************/
 
 
trigger accphonechange on Account (before update) {
list<account> acc=new list<account>();
for(account ac:trigger.new){
    if(ac.phone!=trigger.oldmap.get(ac.id).phone){
        ac.old_phone__c=trigger.oldmap.get(ac.id).phone;
        //ac.Old_Description__c=trigger.oldmap.get(ac.id).Description;
        
        acc.add(ac);
    }
    
    
}

//update acc;





}