public with sharing class ContactTriggerHandler {


    public static void afterInsertHandler(List<Contact> cList){

        set<Id> accList = new set<Id>();
        for(Contact c : cList){
            accList.add(c.AccountId);
        }


        AggregateResult ag = [SELECT COUNT(Id), AccountId from Contact WHERE AccountId IN: accList GROUP BY AccountId];


}

}
