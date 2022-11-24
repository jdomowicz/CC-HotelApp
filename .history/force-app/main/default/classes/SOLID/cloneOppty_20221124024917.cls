public with sharing class cloneOppty implements CloneInterface {

    /*
        This class implement interface and must include the same methods as Interface class!!!
    */

    public Opportunity cloneRecord(Id recordId){
        system.debug('This is clone Oppty logic running');

        Opportunity oldRecord = [Select Id,Name,AccountId,OwnerId FROM Opportunity where Id=: recordId];

        Opportunity opp = new Opportunity();
        opp.Name =oldRecord.Name + 'Clone';
        opp.AccountId = oldRecord.AccountId;
        opp.OwnerId = oldRecord.OwnerId;

    }

    public void cloneRelatedRecords(Id recordId){
        system.debug('This is clone related Oppty records logic running');

    }


}
