@IsTest
public with sharing class ContactTriggerTest {

@TestSetup
static void makeData(){

    list<account> accList = new list<account>();
    for (Integer i=0;i<5;i++){
    account a = new account(
        name = 'a' + i,
        No_of_Contacts__c = 0
    );
        accList.add(a);
    }
    insert accList;
}


    @isTest
    public afterInsertHandlerTest() {

        list<contact> cList = new List<contact>();

        for(account a : [Select Id,Name from Account]){

        for(Integer i = 0; i<20;i++){

            contact c = new contact(FirstName = 'fname'+i,LastName='lname' +i,AccountId = a.Id);
            cList.add(c);
        }

    }

    ASS

}
}
