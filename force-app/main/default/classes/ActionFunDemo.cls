public class ActionFunDemo {
public Account acc{set;get;}
public boolean showtxt{set;get;}
public ActionFunDemo(){
acc=new Account();
showtxt=false;
}
public void StatusChanged(){
if(acc.Active__c=='yes')
{
showtxt=true;
}
else
{
showtxt=false;
}
//return null;
}
}