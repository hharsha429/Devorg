/*Class to display the accounts with check box*/


public class AccountClass {
public List<accountwrapper> accountList = new List<accountwrapper>();
    List<Account> selectedAccounts = new List<Account>();
    public List<accountwrapper> getAccounts(){
        List<Account> allActs = [select Id, Name, AccountNumber, Phone from Account];
        for(Account a : allActs){
            accountList.add(new accountwrapper(a));
        }
        return accountList;
    }
    public List<Account> GetSelectedAccounts(){
        if(selectedAccounts.size()>0){
            return selectedAccounts;
        }else{
            return null;
        }
    }
    public PageReference getSelected(){
        selectedAccounts.clear();
        for(accountwrapper accwrapper : accountList){
            if(accwrapper.selected == true){
                selectedAccounts.add(accwrapper.acc);
            }
        }
        return null;
    }
    public PageReference printPDF(){
        selectedAccounts.clear();
        for(accountwrapper accwrapper : accountList){
            if(accwrapper.selected == true){
                selectedAccounts.add(accwrapper.acc);
            }
        }
        PageReference pdfPage = new PageReference('/apex/accountspdf');
        //pdfPage.setRedirect(true);
        return pdfPage;
    }    
    public class accountwrapper{
        public Account acc{get; set;}
        public Boolean selected {get; set;}
        public accountwrapper(Account a){
            acc = a;
            selected = false;
        }
    }
}