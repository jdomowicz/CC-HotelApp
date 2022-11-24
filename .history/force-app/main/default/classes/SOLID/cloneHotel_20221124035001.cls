public with sharing class cloneHotel implements CloneInterface {

    /*
        This class implement interface and must include the same methods as Interface class!!!
    */

    public Opportunity cloneRecord(Id recordId){
        system.debug('This is clone Oppty logic running');

        Hotel__c oldRecord = [Select Id,Name,City__c,OwnerId FROM Hotel__c where Id=: recordId];

        Hotel__c opp = new Hotel__c();
        opp.Name =oldRecord.Name + ' Cloned';
        opp.AccountId = oldRecord.AccountId;
        opp.OwnerId = oldRecord.OwnerId;
        opp.Clone_of__c = oldRecord.Id;
        opp.StageName = oldRecord.StageName;
        opp.CloseDate = oldRecord.CloseDate;

        insert opp;
        return opp;

    }

    public void cloneRelatedRecords(Id recordId){
        system.debug('This is clone related Oppty records logic running');

    }


}
