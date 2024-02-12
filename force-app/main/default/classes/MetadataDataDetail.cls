public with sharing class MetadataDataDetail
{
  public String Data {get; set;}
  public Double dApiVersion=30;
  public string strSelectedComponent{get;set;}
  public transient String strXML{get;set;}
  public boolean bGuestUser{get;set;}
  public string lstComp {get;set;}
  
  public transient Map<String ,List<ComponentModel>> mapSelectedComponent{get;set;}
  
  /*This method is used for Metadata detail functionality
  */
   public MetadataDataDetail(){
    mapSelectedComponent=new Map<String ,List<ComponentModel>>();
    strSelectedComponent='';
    bGuestUser=false;
    bGuestUser=isGuestUser();
  }
  
  /*This method is used for creating XML file
  */
  public pagereference createProjectXMLFile(){
     Map<String ,List<ComponentModel>> mapSelectedComponent=(Map<String ,List<ComponentModel>>)JSON.deserialize(strSelectedComponent, Map<String ,List<ComponentModel>>.class);
     strSelectedComponent='';
     strXML=ProjectXMLUtil.prepareXmlDetail(mapSelectedComponent);
     pagereference objPage=Page.package;
     return objPage;
  }
 

    public boolean isGuestUser(){
         if(!UserInfo.getUserType().equalsIgnoreCase('guest')){
                return false;
         }
    
    return true;
    }
   
   /*This method is used for constructing response
  */
   public PageReference constructResponse(){
        List<Node> nodes = new List<Node>();
        String node = ApexPages.currentPage().getParameters().get('node');
        String strSessionId='';
        String strInstanceUrl='';
        
        if(!UserInfo.getUserType().equalsIgnoreCase('guest')){
            if(!Test.isRunningTest()){
                strInstanceUrl='https://'+ProjectXMLUtil.getHostName(ApexPages.currentPage().getHeaders().get('Host'))+'/services/Soap/m/31.0';
            }
            strSessionId=UserInfo.getSessionId();
        }else{
            String strEnVironment =ProjectXMLUtil.getEnvironment (); 
            boolean isProduction=strEnVironment.equalsIgnoreCase('Production');
            strInstanceUrl=ProjectXMLUtil.getInstanceURL(isProduction)+'/services/Soap/m/31.0';
            strSessionId=ProjectXMLUtil.getAccessToken(isProduction);
        }
        
        if(node=='root'){
            // List available Metadata Types via the 'describeMetadata' API call
            MetadataService_V1.MetadataPort service = MetadataService_V1.createService(strSessionId,strInstanceUrl);          
            MetadataService_V1.DescribeMetadataResult describeResult = service.describeMetadata(dApiVersion);
            for(MetadataService_V1.DescribeMetadataObject metadataObject : describeResult.metadataObjects)
            {
            if(metadataObject.xmlName=='EmailTemplate'){ 
            
            }
            String strNodeName=metadataObject.xmlName;
            if(metadataObject.inFolder){
                strNodeName=strNodeName+'Folder';
            }
            nodes.add(new FolderNode(strNodeName, metadataObject.xmlName, false, null));
            // Include child Metadata Types (such as CustomField, ValidationRule etc..)
            if(metadataObject.childXmlNames!=null)
                for(String childXmlName : metadataObject.childXmlNames)
                    if(childXmlName!=null)
                    nodes.add(new FolderNode(childXmlName, childXmlName, false, null));
            }
        }      
        else
        {
            // List Metadata for the given type via the listMetadata API call
            MetadataService_V1.MetadataPort service = MetadataService_V1.createService(strSessionId,strInstanceUrl);    
            List<MetadataService_V1.ListMetadataQuery> queries = new List<MetadataService_V1.ListMetadataQuery>();    
            MetadataService_V1.ListMetadataQuery query = new MetadataService_V1.ListMetadataQuery();
            query.type_x = node;
            queries.add(query);    
            MetadataService_V1.FileProperties[] fileProperties = service.listMetadata(queries, dApiVersion);
            // Emit leaf nodes (ensure unique IDs)
            Integer index = 0;
            if(fileProperties!=null){
                for(MetadataService_V1.FileProperties fileProperty : fileProperties){
                    String strCompName=fileProperty.fullName;
                    if(fileProperty.type_x!=null && fileProperty.type_x.endsWithIgnoreCase('Folder') && !fileProperty.type_x.equalsIgnoreCase('Folder')){
                    strCompName=fileProperty.fileName;
                    }
                    nodes.add(new LeafNode(strCompName + ':' + index++, EncodingUtil.urlDecode(strCompName, 'UTF-8'), false));
                }
            }
        }
        Data = JSON.serialize(nodes);
        return null;  
    }
    
   /*Abstract class to generate node
   */
    public abstract class Node
    {
        public String id;
        public String text;
        public String cls;
        public boolean leaf;
        public boolean checked;
        public boolean expanded;
        public List<Node> children;      
    }
    
    /*Class for generating folder nodes
    */
    public class FolderNode extends Node
    {
        public FolderNode(String id, String text, boolean expanded, List<Node> children)
        {  
            this.id = id;
            this.text = text;
            this.cls = 'folder';
            this.leaf = false;
            this.checked = false;
            this.expanded = expanded;
            this.children = children;
        }    
    }
    
    /*Class for generating leaf nodes
    */
    public class LeafNode extends Node
    {
        public LeafNode(String id, String text, boolean checked)
        {  
            this.id = id;
            this.text = text;
            this.cls = null;
            this.leaf = true;
            this.checked = checked;
            this.expanded = false;
            this.children = null;
        }    
    }
}