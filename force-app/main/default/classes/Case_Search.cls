public class Case_Search {

     @AuraEnabled
    public static List<String> getCaseOrgin() { 
        List<Schema.PicklistEntry> values = Case.Origin.getDescribe().getPicklistValues();
        
        List<String> sendPickValues = new List<String>();
        for(Integer i = 0;i<values.size();i++)
        {
            sendPickValues.add(values[i].getValue());
        }
        
        return sendPickValues;    
   }
    
    
    @AuraEnabled
 public static List <Case> getCases(String searchKeyWord) {
  
  List <Case> CaseLst = new List <Case> ();
  List <Case> casesLst = [select id, caseNumber,Origin, Reason, status from Case
                                   where Origin =: searchKeyWord LIMIT 10];
    
 
  for (Case Cse: casesLst) {
   CaseLst.add(Cse);
  }
  return CaseLst;
 }
    
}