// ContactFactory.cls
public class ContactFactory implements DataFactory {
    public sObject getRecord() {
        return new Contact(
            LastName = 'My Contact'
        );
    }

    public sObject createRecord() {
        sObject contact = getRecord();
        insert contact;
        return contact;
    }
}