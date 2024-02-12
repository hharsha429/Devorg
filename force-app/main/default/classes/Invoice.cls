public class Invoice {
    public string name{set;get;}
    public string phone{set;get;}
    public string sname{set;get;}
    public string invc{set;get;}
    public string pcode{set;get;}
    public string amount{set;get;}
    public string Pname{set;get;}
    
    public pagereference show(){
        pagereference p =new pagereference('/apex/invoicepdf');
        return p;
    }
    

}