public class HotelBatchUpdate implements Database.Batchable<Hotel__c>{

    public Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }
}
