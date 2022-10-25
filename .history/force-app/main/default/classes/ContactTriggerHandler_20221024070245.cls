public with sharing class ContactTriggerHandler {

    public static void afterInsertHandler(List<Contact> cList){

       set<Id> accList = new set<Id>();
        for(Contact c : cList){
            accList.add(c.AccountId);
        }
}


    public static void afterUpdateHandler(list<Contact> cList,map<Id,Contact> cMap){

        list<Id> AccountToUpdate = new list<Id>();

        for(contact c: cList){

            if(c.AccountId != cMap.get(c.Id).AccountId){

                AccountToUpdate.add(c.AccountId);
                AccountToUpdate.add(cMap.get(c.Id).AccountId);

            }

        }

}


public static void updateAccountList(list<Account> accList){


}

}
