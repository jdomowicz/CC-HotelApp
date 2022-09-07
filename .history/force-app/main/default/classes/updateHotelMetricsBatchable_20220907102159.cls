public with sharing class updateHotelMetricsBatchable implements Database.Batchable<sObject> {
    
    public String query = 'select id, opportunity__c, RecordTypeId, email, customer_Number__c from contact where createddate <= :d';

    public Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

}
