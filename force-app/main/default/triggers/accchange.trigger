trigger accchange on Account (after insert) {
Map<Id,Decimal> NoOfLoc=new Map<Id,Decimal>();
list<contact>co=new list<contact>();
    for(Account ac :Trigger.New){
        
        if (ac.NumberofLocations__c!= Null)
        {      
            NoOfLoc.put(ac.Id, ac.NumberofLocations__c);
        }
    }
    if(NoOfLoc.size()>0 && NoOfLoc!=null){ 

    for(Id ACCId :NoOfLoc.keySet()){
        for(integer i=0;i<NoOfLoc.get(ACCId);i++){
           contact con=new contact();
            con.LastName='test'+i;
            con.AccountId=ACCId;
            co.add(con);
        }
    }
    }
    database.insert(co);
}