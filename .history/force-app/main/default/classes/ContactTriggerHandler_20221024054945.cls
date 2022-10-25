public with sharing class ContactTriggerHandler {


    public static void afterInsertHandler(List<Contact> cList){

        set<Id> accList = new set<Id>();
        for(Contact c : cList){
            accList.add(c.AccountId);
        }

        list<AggregateResult> aggContacts = [SELECT COUNT(Id) ContactCount, AccountId from Contact WHERE AccountId IN: accList GROUP BY AccountId];

        map<Account,Integer> accInfo = new map<Account,Integer>();

        for(AggregateResult agr : aggContacts){
           System.debug(agr.get('AccountId'));
           accInfo.put((Account) agr.get('AccountId'),(Integer) agr.get('ContactCount'));
        }

        list<Account> accUpdateList = new list<Account>();

        for(Account acc: accInfo.keySet()){

            acc.No_of_Contacts__c = accInfo.get(acc.Id);

            accUpdateList.add(acc);
        }

        update accUpdateList;




}

}
