public with sharing class ContactTriggerHandler {


    public static void afterInsertHandler(List<Contact> cList){

        AggregateResult ag = [SELECT COUNT(Id), AccountId from Contact WHERE AccountId IN: cList.AccountId GROUP BY AccountId];


}

}
