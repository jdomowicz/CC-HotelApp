public with sharing class ContactTriggerHandler {

    public static void afterInsertHandler(List<Contact> cList){

       set<Id> AccountToUpdate = new set<Id>();
        for(Contact c : cList){
            AccountToUpdate.add(c.AccountId);
        }

        updateAccountList(AccountToUpdate);
}


    public static void afterUpdateHandler(list<Contact> cList,map<Id,Contact> cMap){

        set<Id> AccountToUpdate = new set<Id>();

        for(contact c: cList){

            system.debug(c.AccountId);
            system.debug(cMap.get(c.Id).AccountId);
            system.debug(c.AccountId != cMap.get(c.Id).AccountId);
            //system.debug(c.AccountId !== cMap.get(c.Id).AccountId);

            if(c.AccountId != cMap.get(c.Id).AccountId){

                system.debug('this account is not equal to new account');

                AccountToUpdate.add(c.AccountId);
                AccountToUpdate.add(cMap.get(c.Id).AccountId);

            }
        


        }
}

    public static void afterDelete(list<Contact> cList){

         set<Id> AccountToUpdate = new set<Id>();
        for(Contact c : cList){
            AccountToUpdate.add(c.AccountId);
        }

        updateAccountList(AccountToUpdate);
}


    public static void updateAccountList(set<Id> accList){

        map<Id,Integer> accInfo = new map<Id,Integer>();
        for(AggregateResult agr : [SELECT COUNT(Id) ContactCount, AccountId from Contact WHERE AccountId IN: accList
                                             AND AccountId <> null
                                             GROUP BY AccountId]){

           accInfo.put((Id) agr.get('AccountId'),(Integer) agr.get('ContactCount'));
        }

        for(list<Account> accL: [Select Id,Name from Account where Id IN:accInfo.keySet()]){

            list<Account> accountsToUpdate = new list<Account>();

                for(account acc :accL){
    		    acc.No_of_Contacts__c = accInfo.get(acc.Id);
                accountsToUpdate.add(acc);
            }

            update accountsToUpdate;

		}

}

}
