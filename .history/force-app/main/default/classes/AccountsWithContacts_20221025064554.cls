public with sharing class AccountsWithContacts {


    @AuraEnabled
    public static list<Account> accountList() {

        return [SELECT id,Name from Account];

    }

  
}
