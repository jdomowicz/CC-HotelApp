public class CloneAccounts implements CloneRecordInterface {

    public Id cloneRecords(Id recordId){

        Id newId;

        system.debug('Account record method has been called!');

       Account oldAcc = [Select Id,Name from Account where Id=:recordId];

        Account a = new Account(
            Name=oldAcc.Name,
            CloneOf__c = oldAcc.Id
        );
        insert a;

        newId = a.Id;

        return newId;

        system.debug();

    }

}