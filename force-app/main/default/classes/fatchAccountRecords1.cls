public class fatchAccountRecords1{


public fatchAccountRecords1()
{
fetchAccounts();
}
        public static String fetchAccounts(){

            string strSessionid = loginsalesforce.login();

             

            HttpRequest req = new HttpRequest();       

            //String strEndpointURL = 'https://na15.salesforce.com/services/apexrest/BoxRecords';

            String strEndpointURL = 'https://ap2.salesforce.com/services/apexrest/harsha1/accountrecords';

            req.setEndpoint(strEndpointURL);

            req.setMethod('GET'); 

            //req.setBody('');

            req.setTimeout(60000);

req.setHeader('Authorization','Bearer '+strSessionid );

            //req.setHeader('Content-Type', 'application/xml');
            req.setHeader('Accept', 'application/xml');       

     

            HttpResponse res =  new Http().send(req);

            system.debug('response'+ res);

            system.debug('response'+ res.getBody());

            return res.getBody();

        }   

    }