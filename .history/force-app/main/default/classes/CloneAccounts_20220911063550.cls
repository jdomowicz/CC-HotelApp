public class CloneAccounts implements CloneRecordInterface {

    public Id cloneRecords(Id recordId){

        system.debug('Account record method has been called!');

       Account oldAcc = [Select Id,Name from Account where Id=:];


        Account a = new Account(
            Name=''
        );

        Id createdRecord = 

    }

}