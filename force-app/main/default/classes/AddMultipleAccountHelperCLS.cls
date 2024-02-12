public class AddMultipleAccountHelperCLS {

    public static List<AddMultipleAccountCLS.WrapperpaAccountList> addNewRowToAccList(List<AddMultipleAccountCLS.WrapperpaAccountList> waAccObjList){
        AddMultipleAccountCLS.WrapperpaAccountList newRecord = new AddMultipleAccountCLS.WrapperpaAccountList();
        Account newAccountRecord = new Account();
        contact con=new contact();
        opportunity  opp= new opportunity();     
        newRecord.record = newAccountRecord;
        newRecord.index = waAccObjList.size();
		newRecord.c=con;
		newRecord.o=opp;
        waAccObjList.add(newRecord);
        return waAccObjList;
    }
    
    
     public static List<AddMultipleAccountCLS.WrapperpaAccountList> removeRowToAccountList(Integer rowToRemove, List<AddMultipleAccountCLS.WrapperpaAccountList> waAccountList){
        waAccountList.remove(rowToRemove);
        return waAccountList;
    }
    
    public static void save(List<AddMultipleAccountCLS.WrapperpaAccountList> waAccList) {
        system.debug('==waAccList==>'+waAccList.size());
        List<Account> accountRecordsToBeInserted = new List<Account>();
         List<contact> contactsRecordsToBeInserted = new List<contact>();
         List<opportunity> opportunityRecordsToBeInserted = new List<opportunity>();
        Account accTemp = new account();
        contact contemp = new contact();
        opportunity opptemp = new opportunity();
        if(waAccList !=null && !waAccList.isEmpty()){
            for(AddMultipleAccountCLS.WrapperpaAccountList eachRecord : waAccList ){
                accTemp = eachRecord.record;
                contemp= eachRecord.c;
                opptemp= eachRecord.o;

                accountRecordsToBeInserted.add(accTemp);

                                 
            }
            system.debug('==accountRecordsToBeInserted==>'+accountRecordsToBeInserted.size());
            system.debug('****before '+accountRecordsToBeInserted[0].id);
            insert accountRecordsToBeInserted;
            system.debug('****'+accountRecordsToBeInserted[0].id);
                            
              contemp.accountId=accTemp.id;
                
                opptemp.accountId=accTemp.id;
                             contactsRecordsToBeInserted.add(contemp);
                    opportunityRecordsToBeInserted.add(opptemp);
             insert contactsRecordsToBeInserted;
             insert opportunityRecordsToBeInserted;
        }
    }
}