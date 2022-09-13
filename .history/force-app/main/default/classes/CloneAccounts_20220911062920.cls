public class CloneAccounts implements CloneRecordInterface {

    public Account cloneRecords(Id recordId){

        system.debug('Account record method has been called!');

        account acc = [SELECT Id,Name];


        Account acc = new Account()

    }

}