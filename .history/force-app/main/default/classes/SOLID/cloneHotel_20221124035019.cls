public with sharing class cloneHotel implements CloneInterface {

    /*
        This class implement interface and must include the same methods as Interface class!!!
    */

    public Opportunity cloneRecord(Id recordId){
        system.debug('This is clone Oppty logic running');

        Hotel__c oldRecord = [Select Id,Name,City__c,OwnerId FROM Hotel__c where Id=: recordId];

        Hotel__c hotelRecord = new Hotel__c();
        hotelRecord.Name =oldRecord.Name + ' Cloned';
        hotelRecord.AccountId = oldRecord.AccountId;
        hotelRecord.OwnerId = oldRecord.OwnerId;

        insert opp;
        return opp;

    }

    public void cloneRelatedRecords(Id recordId){
        system.debug('This is clone related Oppty records logic running');

    }


}
