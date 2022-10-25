public with sharing class AccountsWithContacts {
    
    @AuraEnabled
    public static string methodName(){
        try {
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    public AccountsWithContacts() {

    }
}
