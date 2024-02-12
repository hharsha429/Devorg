public class ProjectXMLUtil {
    public static String cookieName = 'Apex_AccessToken';
    public static String cookieNameSandbox = 'SandboxApex_AccessToken';
    public static String instanceURL = 'instanceURL';
    public static String instanceURLSandbox = 'SnadboxInstanceURL';
    public static String enVironment = 'Production';
    public static String IdURL = 'IdUrl';
    public static String IdURLSandbox = 'SandboxIdUrl';
    
    /*This method is used to get parent component detail.
    */
    public Map<String,ProjectXMLModel> getParentComponentDetail(Set<String> setComponent){
        Map<String,ProjectXMLModel> mapComponent=new Map<String,ProjectXMLModel>();
        
        for(String str:setComponent){
            mapComponent.put(str,new ProjectXMLModel());
        }
        return mapComponent;
    }
    
    /*This method is used to get host name.
    */
    public static String getHostName(String strHost){
        if(strHost!=null && strHost.indexOf('salesforce.com')>-1){
            strHost=strHost;
        }else{
          List<String> lstSplit=strHost.split('\\.');
           if(lstSplit.size()>0){
             strHost= lstSplit.get(1)+'.salesforce.com';
            }
        }    
     return  strHost;
    }
     
    /*This method is used to prepare XML Detail.
    */  
    public static String prepareXmlDetail(Map<String ,List<ComponentModel>> mapSelectedComponent){
        Dom.Document doc = new Dom.Document();
        Dom.Xmlnode rootNode = doc.createRootElement('Package', null, null);
        rootNode.setAttribute('xmlns', 'http://soap.sforce.com/2006/04/metadata');
        
        for(String strName:mapSelectedComponent.keySet()){
            Dom.Xmlnode types = rootNode.addChildElement('types', null, null);
            Dom.Xmlnode name = types.addChildElement('name', null, null).addTextNode(''+strName);
            
            for(ComponentModel objComponentModel:mapSelectedComponent.get(strName)){
                types.addChildElement('members', null, null).addTextNode(''+objComponentModel.ComponentName);
            }
        }
        return formatXmlInReadableMode(doc.toXmlString());
    } 
    
    /*This method is used to prepare formatted XML Detail.
    */ 
    public String prepareFormattedXmlDetail(Map<String ,List<ComponentModel>> mapSelectedComponent){
        String strXml='';
        XmlStreamWriter xmlWriter = new XmlStreamWriter();
        xmlWriter.writeStartDocument('utf-8', '1.0');        
        xmlWriter.writeStartElement(null, 'Package', null);
        xmlWriter.writeAttribute(null, null, 'xmlns', 'http://soap.sforce.com/2006/04/metadata');
        
        for(String strName:mapSelectedComponent.keySet()){
            xmlWriter.writeStartElement(null, 'types', null);
            xmlWriter.writeStartElement(null, 'name', null);
            xmlWriter.writeCharacters(''+strName);
            xmlWriter.writeEndElement();
            
            for(ComponentModel objComponentModel:mapSelectedComponent.get(strName)){
                xmlWriter.writeStartElement(null, 'members', null);
                xmlWriter.writeCharacters(''+objComponentModel.ComponentName);
                xmlWriter.writeEndElement();
            }
            xmlWriter.writeEndElement();
        }
        xmlWriter.writeEndElement();
        strXml= xmlWriter.getXmlString();
        xmlWriter.close();     
        return formatXmlInReadableMode(strXml);
    } 
    
    /*This method is used to prepare XML Detail in readable mode.
    */ 
    public static String formatXmlInReadableMode(String strXmlString){
        return strXmlString.replaceAll('<Package','\n<Package').replaceAll('<types>','\n <types>').replaceAll('<name>','\n    <name>').
        replaceAll('<members>','\n    <members>').replaceAll('</types>','\n </types>').replaceAll('</Package>','\n</Package>');
    }
    
    /*This method is used to get access token.
    */ 
    public static String getAccessToken(boolean isProduction){
        if(!isProduction){ 
            cookieName=cookieNameSandbox; 
        } 
        if(ApexPages.currentPage().getCookies().get(cookieName)==null){
            return null;
        }
        return(ApexPages.currentPage().getCookies().get(cookieName).getValue());
    }
    
    /*This method is used to delete access token.
    */ 
    public static void deleteAccessToken(){
        ApexPages.currentPage().setCookies(new Cookie[]{new Cookie(cookieName,null,null,0,false)});
        ApexPages.currentPage().setCookies(new Cookie[]{new Cookie(cookieNameSandbox,null,null,0,false)});
        ApexPages.currentPage().setCookies(new Cookie[]{new Cookie(instanceURL,null,null,0,false)});
        ApexPages.currentPage().setCookies(new Cookie[]{new Cookie(instanceURLSandbox,null,null,0,false)});
    }
    
    /*This method is used to get instance url.
    */ 
    public static String getInstanceURL(boolean isProduction){
        if(!isProduction){
            instanceURL=instanceURLSandbox;
        }  
        if(ApexPages.currentPage().getCookies().get(instanceURL )==null){
            return 'https://na10.salesforce.com';
        }
        return(ApexPages.currentPage().getCookies().get(instanceURL).getValue());
    }
    
    /*This method is used to get id url.
    */ 
    public static String geIdURL(){
        if(ApexPages.currentPage().getCookies().get(IdUrl )==null){
            return 'https://na10.salesforce.com';
        }
            return(ApexPages.currentPage().getCookies().get(IdUrl).getValue());
    }
    
    /*This method is used to get environment.
    */ 
    public static String getEnvironment (){
        if(ApexPages.currentPage().getCookies().get(enVironment )==null){
            return 'Production';
        }
        return(ApexPages.currentPage().getCookies().get(enVironment ).getValue());
    } 
    
    /*This method is used to set access token.
    */ 
    public static void setAccessToken(String accessToken,String instanceURL2,String strId,boolean isProduction ){
        if(!isProduction){
            instanceURL=instanceURLSandbox;
        }
        if(!isProduction){ 
            cookieName=cookieNameSandbox; 
        } 
        deleteAccessToken();
        Integer expires = 3600;
        ApexPages.currentPage().setCookies(new Cookie[]{new Cookie(cookieName,accessToken ,null,-1,false)});
        ApexPages.currentPage().setCookies(new Cookie[]{new Cookie(instanceURL ,instanceURL2 ,null,-1,false)});
        ApexPages.currentPage().setCookies(new Cookie[]{new Cookie(IdUrl ,strId ,null,-1,false)});
        ApexPages.currentPage().setCookies(new Cookie[]{new Cookie(enVironment ,isProduction?'Production':'Sandbox',null,-1,false)});  
    }
    
    /*This method is used to validate token.
    */    
    public static boolean validateToken(String strToken,String strInstanceUrl){
        HttpRequest req = new HttpRequest();
        req.setEndpoint(strInstanceUrl+'/services/data/v26.0/sobjects/User');
        req.setMethod('GET');
        req.setHeader('Authorization','Bearer '+strToken);
        Http http = new Http();
        if(!Test.isRunningTest()){ 
            HTTPResponse res = http.send(req);
            
            if(res.getStatusCode()==200){
                return true;
            }
        }
        return false; 
    }
}