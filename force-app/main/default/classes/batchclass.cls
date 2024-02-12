global class batchclass implements database.Batchable <sobject> {

    global database.QueryLocator start(database.BatchableContext bc){
        return database.getquerylocator('select id,name,phone from account ');
    }
    global void execute(Database.BatchableContext BC, List<account> scope){
	     //List<account> lC = new List<account>();
	     for(account s : scope){
	         s.name='mr. '+s.name;
             s.phone='+91-'+s.phone;
	     }
	     update scope;
	    }
	 
	   global void finish(Database.BatchableContext BC){
	   }
	}