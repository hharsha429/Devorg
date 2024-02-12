/************************************************
** Discription:controller to create clone 
** Version :36
** Author:harsha
** Created Date:14-03-2016
*************************************************/

public class ContactCloneController {

    //added an instance varaible for the standard controller
    private ApexPages.StandardController controller {get; set;}
     // add the instance for the variables being passed by id on the url
    private account po {get;set;} //object that u want to clone
    // set the id of the record that is created -- ONLY USED BY THE TEST CLASS
    public ID newRecordId {get;set;}

    // initialize the controller
    public ContactCloneController(ApexPages.StandardController controller) {

        //initialize the stanrdard controller
        this.controller = controller;
        // load the current record
        po = (account)controller.getRecord();

    }

    // method called from the VF's action attribute to clone the po
    public PageReference cloneWithItems() {

         // setup the save point for rollback
         Savepoint sp = Database.setSavepoint();
         account acc;

         try {

              //copy the accounts  - ONLY INCLUDE THE FIELDS YOU WANT TO CLONE
             po = [select Id, Name, AccountSource, Industry from account where id = :po.id];
             acc = po.clone(false);
             insert acc;

             // set the id of the new po created for testing
               newRecordId = acc.id;

             // copy over the contacts- ONLY INCLUDE THE FIELDS YOU WANT TO CLONE
             List<contact> cons = new List<contact>();// object that is related to cloning object
             
             for (contact co : [Select Id, accountid, phone,LastName From contact p where accountid = :po.id]) {
                  contact con = co.clone(false);
                  con.accountid = acc.id;
                  cons.add(con);
             }
             insert cons;

         } catch (Exception e){
             // roll everything back in case of error
            Database.rollback(sp);
            ApexPages.addMessages(e);
            return null;
         }

        return new PageReference('/'+acc.id+'/e?retURL=%2F'+acc.id);
    }

}