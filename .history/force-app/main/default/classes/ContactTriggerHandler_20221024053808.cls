public with sharing class ContactTriggerHandler {


    public static void afterInsertHandler(List<Contact> cList){

        set<Id> accList = new set<Id>();
        for(Contact c : cList){
            accList.add(c.AccountId);
        }

        list<AggregateResult> aggContacts = [SELECT COUNT(Id) ctd, AccountId from Contact WHERE AccountId IN: accList GROUP BY AccountId];

        map<Id,Integer> accInfo = new list<Id,Integer>();

        for(AggregateResult agr : aggContacts){

            accInfo.put(agr.get('AccountId'),agr.get('ContactCount'));



        }


}

}
