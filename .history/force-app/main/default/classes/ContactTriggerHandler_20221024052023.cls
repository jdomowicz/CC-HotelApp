public with sharing class ContactTriggerHandler {


    public static void afterInsertHandler(List<Contact> cList){

        list<Id> accList = new list<Id>();
        for(Contact c : cList){

            accList.
        }


        AggregateResult ag = [SELECT COUNT(Id), AccountId from Contact WHERE AccountId IN: cList.AccountId GROUP BY AccountId];


}

}
