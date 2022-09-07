public with sharing class updateHotelMetricsBatchable implements Database.Batchable<sObject> {
    
    
    public Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

}
