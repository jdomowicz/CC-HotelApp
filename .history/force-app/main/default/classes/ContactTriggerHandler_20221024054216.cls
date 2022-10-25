public with sharing class ContactTriggerHandler {


    public static void afterInsertHandler(List<Contact> cList){

        set<Id> accList = new set<Id>();
        for(Contact c : cList){
            accList.add(c.AccountId);
        }

        list<AggregateResult> aggContacts = [SELECT COUNT(Id) ContactCount, AccountId from Contact WHERE AccountId IN: accList GROUP BY AccountId];

        map<Id,Integer> accInfo = new map<Id,Integer>();

        for(AggregateResult agr : aggContacts){
           System.debug(agr.get('AccountId'));
           accInfo.put((Id) agr.get('AccountId'),(Integer) agr.get('ContactCount'));
        }




}

}
