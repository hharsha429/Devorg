public class ListExample {
    public List<String> names {set;get;}
public List<Account> accs {set;get;}
public List<ProdWrap> products {set;get;}
public List<ProdWrap> selected {set;get;}
public ListExample(){
names=new List<String>{'sam','Ram','Kiran'};
accs=new List<Account>();
products=new List<ProdWrap>();
Account a1=new Account(Name='Tcs',Industry='Technology');
Account a2=new Account(Name='IBM',Industry='Energy');
accs.add(a1);
accs.add(a2);
for(Integer i=0;i<4;i++){
ProdWrap pw=new Prodwrap();
products.add(pw);
}
}
public void getValues(){
selected=new List<ProdWrap>();
for(ProdWrap ps:products){
if(ps.flag==true){
selected.add(ps);
}
}
}
}