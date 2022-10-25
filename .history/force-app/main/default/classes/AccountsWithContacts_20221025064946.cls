public class AccountsWithContacts {


    @AuraEnabled
    public static list<Account> accountList() {
        return [SELECT id,Name from Account];

    }

      @AuraEnabled
    public static list<Account> accountData(Id AccId) {
        return [SELECT id,Name from Account Where Id =: AccId];

    }

    @AuraEnabled
    public static list<Account> accountWithContacts(Id AccId){
        try {

            return [Select Id,Name,(Select Id,Name from Contacts) from Acccount where Id =: ]


        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}
