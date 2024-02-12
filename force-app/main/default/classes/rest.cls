@RestResource(urlMapping='/accountrecords/*') 

    global class rest{

        @HttpGet

        global static Account[] extractAccountData() { 

            //Returns the RestRequest object for our Apex REST method. 

            RestRequest request = RestContext.request; 

            //Returns the RestResponse for our Apex REST method. 

            RestResponse response = RestContext.response; 

            //query the Box Folder 

            List<Account> lstAccount = new List<Account>();

            try{

                lstAccount = [SELECT Id, Name FROM Account]; 
                system.debug(lstAccount);

            }catch(Exception e){

                system.debug('@@@@@ Error ' + e.getMessage());

            }

            return lstAccount; 

        }

    }