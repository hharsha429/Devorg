public class ProjectXMLModel {
    public String strMembers{get;set;}
    public String strName{get;set;}
    public boolean isSelected{get;set;}
    public boolean isAll{get;set;}
    public boolean isParent{get;set;}
    public List<ChildWrapper> lstChildWrapper{get;set;}
    
    /*This is inner class to declare members
    */
    public class ChildWrapper{
        public String strMembers{get;set;}
        public String strName{get;set;}
        public boolean isSelected{get;set;}
        
    }
}