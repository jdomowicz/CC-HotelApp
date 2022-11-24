public with sharing class cloneHotel implements CloneInterface {

    /*
        This class implement interface and must include the same methods as Interface class!!!
    */

    public Opportunity cloneRecord(Id recordId){
        system.debug('This is clone Oppty logic running');

        hotel oldRecord = [Select Id,Name,AccountId,OwnerId,Clone_of__c,StageName,CloseDate FROM Opportunity where Id=: recordId];

        Opportunity opp = new Opportunity();
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
