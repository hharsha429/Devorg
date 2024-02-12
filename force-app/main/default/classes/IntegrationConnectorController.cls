public with sharing class IntegrationConnectorController {
    @AuraEnabled
   public static void getMetaDataRecords( string Name){

    List<Integration_Configurator__mdt> mdtList =[SELECT End_Point_Url__c,Request_Json__c,
    Request_Type__c FROM Integration_Configurator__mdt WHERE MasterLabel =: Name];
   System.debug('======>'+mdtList);

   }
}