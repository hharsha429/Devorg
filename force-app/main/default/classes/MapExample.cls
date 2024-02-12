public class MapExample{
    public map<string,list<string>> abc {get;set;}
     list<SelectOption>Places{get;set;}
    list<SelectOption>cities{get;set;}
    public MapExample(){
        
       abc=new map<string,list<string>>();
       list<string>  Hyd=new list<string>{'ameerpet','s.r.nagar','motinagar'};
       list<string>  Ban=new list<string>{'marthali','hebbal','koramangala'};
       list<string>  Che=new list<string>{'kodambakkam','t nagar','annanagar'};
       list<string>  Kol=new list<string>{'shenoy','ambl','tnp'};
        
    
    
    abc.put('Hyderabad',Hyd);
    abc.put('Bangalore',Ban);
    abc.put('Chennai',Che);
    abc.put('Kolkata',Kol);
    
    set<string> cty=abc.keyset();
    for(string s:cty){
       // SelectOption op=new selectoption(s,s);
    cities.add(new selectoption(s,s));
    
    }
    

}
}