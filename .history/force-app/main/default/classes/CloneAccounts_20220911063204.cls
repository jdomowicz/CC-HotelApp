public class CloneAccounts implements CloneRecordInterface {

    public void cloneRecords(Id recordId){

        system.debug('Account record method has been called!');

        account acc = [SELECT Id,Name from Account where Id =:recordId];

        return acc;

    }

}