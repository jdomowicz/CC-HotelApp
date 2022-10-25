@IsTest
public with sharing class ContactTriggerTest {

@TestSetup
static void makeData(){

    for (i=0;i<5;i++){
    account a = new account(
        name = 'a' + i,
        No_of_Contacts__c = 0
    );
    }

    for()

}


    public ContactTriggerTest() {

    }
}
