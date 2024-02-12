public class pageref {
    public list<selectoption>se {set;get;}
    public string sel{get;set;}
    Public string sel1{set;get;}
    public pageref(){
        
      se=new list<selectoption>();
        se.add(new selectoption('--None--','None'));
        se.add(new selectoption('Hyderabad','Hyd'));
        se.add(new selectoption('Mumbai','Mum'));
        se.add(new selectoption('Bangalore','Bang'));
    }
    public void show(){
        
    
        if(sel=='Hyderabad'){
            sel1='u have selected Hyderebad';
        }
        if(sel=='Mumbai'){
            sel1='u have selected Mumbai';
        }
        if(sel=='Bangalore'){
            sel1='u have selected Bangalore';
        }
    }

}