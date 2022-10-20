// AccountFactory.cls
public class AccountFactory implements DataFactory {
    public sObject getRecord() {
        return new Account(
            Name = 'My Account'
        );
    }

    public sObject createRecord() {
        Account account = getRecord();
        insert account;
        return acccount;
    }
}