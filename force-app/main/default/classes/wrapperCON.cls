public class wrapperCON {
    private List<Account> tempAcct = new List<Account>();
    private Map<ID,List<Opportunity>> AcctOppMAP = new Map<ID,List<Opportunity>>();
    private Set<ID> AcctIDs = new Set<ID>();//account ids to get opportunities from
    public List<wrapper> wrapout {get; set;}
    //constructor
    public wrapperCON(){
       wrapout = new List<wrapper>();
    }    
    //wrapper 1
    class wrapper{
        public Account acct {get; set;}
        //This is a list of other wrappers that is nested in the first list
        public List<wrapper2> opps {get; set;}
        public wrapper(){
            if(acct==null){acct = new Account();}//initialize the account holder
            if(opps==null){opps = new List<wrapper2>();}//initialize the wrapper listholder
        }
    }
    //wrapper 2 - the sub-wrapper
    class wrapper2{
        public Opportunity Opp {get; set;}
        public List<Product2> oppprods {get; set;}
        public wrapper2(){
            if(Opp==null){Opp = new Opportunity();}//initialize the Opportunity holder
            if(oppprods==null){oppprods = new List<Product2>();}//initialize the product2 holder
        }
    }
    
    //This is the "Run Demo" Button on our VF page
    public PageReference buildwrapper() {
        tempAcct = [select id,name from Account where id in (select accountid from Opportunity) limit 10];
        for(Account a:tempAcct){AcctIDs.add(a.id);}
        for(Opportunity o:[select id,name,accountid from Opportunity where Accountid=:AcctIDs]){
            if(AcctOppMap.containsKey(o.accountid)){
                AcctOppMap.get(o.Accountid).add(o);//adds opportunity for this account to the opp list in the map    
            }else{
                AcctOppMap.put(o.Accountid,new List<Opportunity>{o});//adds new opportunity list for this account to the map    
            }
        }
        for(Account aa:tempAcct){
            wrapper tmpwrapper = new wrapper();
            tmpwrapper.acct=aa;
            List<wrapper2> t2 = new List<wrapper2>();
            for(Opportunity oo:AcctOppMap.get(aa.id)){
                wrapper2 twrap2 = new wrapper2();
                twrap2.Opp=oo;
                t2.add(twrap2);
            }
            tmpwrapper.opps=t2;
            wrapout.add(tmpwrapper);
        }


        return null;
    }

    
}