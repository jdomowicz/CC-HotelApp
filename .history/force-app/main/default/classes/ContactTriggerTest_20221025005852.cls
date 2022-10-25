@IsTest
public with sharing class ContactTriggerTest {

@TestSetup
static void makeData(){

    list<account> accList = new list<account>();
    for (i=0;i<5;i++){
    account a = new account(
        name = 'a' + i,
        No_of_Contacts__c = 0
    );
    accList.add(a);
    
    }

}


    public ContactTriggerTest() {

    }
}
