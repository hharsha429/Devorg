public class loginsalesforce{

        private static final String NS_SOAP = 'http://schemas.xmlsoap.org/soap/envelope/';

        private static final String NS_SF = 'urn:partner.soap.sforce.com';

     

        public static String login()

        {

            string user = 'test@tecra.com';

            string password = 'Vardhan12@obsKdkAF60S8Mt1Jy8hqnNBD';       

             

            HttpRequest req = new HttpRequest();

            req.setMethod('POST');  

            req.setTimeout(60000);

            req.setEndpoint('https://login.salesforce.com/services/Soap/u/29.0');

            req.setHeader('Content-Type', 'text/xml;charset=UTF-8');       

            req.setHeader('SOAPAction', '""');

            req.setBody('<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"><Header/><Body><login xmlns="urn:partner.soap.sforce.com"><username>' +user+ '</username><password>' + password + '</password></login></Body></Envelope>');       

            HttpResponse res =  new Http().send(req);

            system.debug('response'+ res);

            system.debug('response'+ res.getBody());

            if(res.getStatusCode() != 200)

            {

                Dom.Document responseDocument = res.getBodyDocument();

                Dom.Xmlnode rootElm = responseDocument.getRootElement(); // soapenv:Envelope

                Dom.Xmlnode bodyElm = rootElm.getChildElement('Body', NS_SOAP); // soapenv:Body

                Dom.Xmlnode faultElm = bodyElm.getChildElement('Fault', NS_SOAP); // soapenv:Fault

                Dom.Xmlnode faultStringElm = faultElm.getChildElement('faultstring', null); // faultstring         

                throw new LoginException(faultStringElm.getText());

            }

            // As per http://wiki.developerforce.com/page/Enterprise_Login

            Dom.Document responseDocument = res.getBodyDocument();

            Dom.Xmlnode rootElm = responseDocument.getRootElement(); // soapenv:Envelope

            Dom.Xmlnode bodyElm = rootElm.getChildElement('Body', NS_SOAP); // soapenv:Body

            Dom.Xmlnode loginResponseElm = bodyElm.getChildElement('loginResponse', NS_SF); // loginResponse

            Dom.Xmlnode resultElm = loginResponseElm.getChildElement('result', NS_SF); // result

            Dom.Xmlnode sessionIdElm = resultElm.getChildElement('sessionId', NS_SF); // sessionId

            return sessionIdElm.getText();

        }

        public class LoginException extends Exception {}

    }