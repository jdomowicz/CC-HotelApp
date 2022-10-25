public with sharing class ContactTriggerHandler {


    public static void afterInsertHandler(List<Contact> cList){

        set<Id> accList = new set<Id>();
        for(Contact c : cList){
            accList.add(c.AccountId);
        }

        list<AggregateResult> aggContacts = [SELECT COUNT(Id) ContactCount, AccountId from Contact WHERE AccountId IN: accList GROUP BY AccountId];

        map<String,Integer> accInfo = newmap<String,Integer>();

        for(AggregateResult agr : aggContacts){

           System.debug(agr.get('AccountId'));
        }




}

}
