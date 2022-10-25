public with sharing class AccountsWithContacts {



    @AuraEnabled
    public static list<Account> AccountsWithContacts() {

        return [SELECT id,Name from Account];

    }
}
