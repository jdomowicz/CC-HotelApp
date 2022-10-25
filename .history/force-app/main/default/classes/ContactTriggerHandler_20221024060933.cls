public with sharing class ContactTriggerHandler {


    public static void afterInsertHandler(List<Contact> cList){

       set<Id> accList = new set<Id>();
        for(Contact c : cList){
            accList.add(c.AccountId);
        }

        map<Id,Integer> accInfo = new map<Id,Integer>();
        for(AggregateResult agr : [SELECT COUNT(Id) ContactCount, AccountId from Contact WHERE AccountId IN: accList
                                             AND AccountId <> null
                                             GROUP BY AccountId]){
           accInfo.put((Id) agr.get('AccountId'),(Integer) agr.get('ContactCount'));
        }


	list<Account> accountsToUpdate = new list<Account>();

		for(Account acc: [Select Id,Name from Account where Id IN:accInfo.keySet()]){
    		acc.No_of_Contacts__c = accInfo.get(acc.Id);
            accountsToUpdate.add(acc);
		}

	update accountsToUpdate;


}

}
