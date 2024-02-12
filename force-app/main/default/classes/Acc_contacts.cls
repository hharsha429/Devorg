public class Acc_contacts {
public List<Account> getList(){
        return [Select Name, Id, (Select Name,phone From Contacts) From Account];
    }
}