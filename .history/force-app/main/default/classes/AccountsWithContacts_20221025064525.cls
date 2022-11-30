public with sharing class AccountsWithContacts {



    @AuraEnabled
    public static list<Account> account() {

        return [SELECT id,Name from Account];

    }

    @AuraEnabled
    public static list<Account> AccountsWithContacts(Id AccId) {

        return [SELECT id,Name from Account Where Id =: AccId];

    }
}