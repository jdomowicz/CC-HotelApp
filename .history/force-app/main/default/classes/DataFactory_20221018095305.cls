public class DataFactory {

    public static Account createAccount() {
        Account account = new Account(
            Name = 'My Account',
            Email = 'myAccount@email.com'
        );
        insert account;
        return account;
    }

    public static Contact createContact() {
        Contact contact = new Contact(
            LastName = 'My Contact'
        );
        insert contact;
        return contact;
    }
}public with sharing class DataFactory {
    public DataFactory() {

    }
}
