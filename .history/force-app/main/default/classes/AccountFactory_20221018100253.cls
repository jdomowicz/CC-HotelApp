// AccountFactory.cls
public class AccountFactory implements DataFactory {
    public sObject getRecord() {
        return new Account(
            Name = 'My Account'
        );
    }

    public sObject createRecord() {
        //Account acc = getRecord();
       // insert acc;
       sObject account =  getRecord();

       insert account;
       return account;
    }
}