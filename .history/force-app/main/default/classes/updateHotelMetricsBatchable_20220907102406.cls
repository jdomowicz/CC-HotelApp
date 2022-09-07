public with sharing class updateHotelMetricsBatchable implements Database.Batchable<sObject> {

    public String query = 'SELECT Id,TTM_ACV__c from Hotel__c';

    public Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

   public void execute(Database.BatchableContext BC, List<Hotel__c> scope){

   }

   public void finish(Database.BatchableContext BC){
   }

}
