@IsTest
public with sharing class ContactTriggerTest {

@TestSetup
static void makeData(){

    account a = new account(
        name = 'a' + i,
        No_of_Contacts__c = 0
    );


}


    public ContactTriggerTest() {

    }
}
