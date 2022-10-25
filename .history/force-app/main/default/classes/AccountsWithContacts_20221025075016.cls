public with sharing class AccountsWithContacts {


    @AuraEnabled (cacheable=true)
    public static list<Account> accountList() {
                return [SELECT id,Name from Account LIMIT 10];

    }

      @AuraEnabled
    public static list<Account> accountData(String AccId) {
        return [SELECT id,Name from Account Where Id =: AccId];

    }

    @AuraEnabled
    public static list<Account> accountWithContacts(list<String> AccId){
        try {

            return [Select Id,Name,(Select Id,Name from Contacts) from Account where Id =: AccId];


        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}
