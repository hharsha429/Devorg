/* Description:
    * ============
    * Class for the VF Page GenericPaginationUsagePage *
    * Author:
    * ========
    * 
    */
    public class GenericPaginationUsageContrl {
    //Declaring variables to store list of records.
    public List<Account> accLst {get;set;}
    public List<Contact> conLst {get;set;}
    public List<Opportunity> oppLst {get;set;}
    //Declaring variables to store list of Field API names in string format.
    public List<String> accFieldLst {get;set;}
    public List<String> conFieldLst {get;set;}
    public List<String> oppFieldLst {get;set;}
    //Default Constructor
    public GenericPaginationUsageContrl() {
    //Querying the records from the database.
    accLst = [select Name, AccountNumber, Fax, Phone, Industry from Account limit 100];
    conLst = [select Name, AccountId, Email, Phone from Contact limit 100];
    oppLst = [select Name, AccountId, Amount from Opportunity limit 100];
    //Preparing the list of fields to display in the table.
    accFieldLst = new List<String>{'Name', 'AccountNumber', 'Fax', 'Phone', 'Industry'};
    conFieldLst = new List<String>{'Name', 'AccountId', 'Email', 'Phone'};
    oppFieldLst = new List<String>{'Name', 'AccountId', 'Amount'};
    }
    }