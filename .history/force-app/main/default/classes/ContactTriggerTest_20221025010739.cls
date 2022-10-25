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

        list<Account> accList = [Select Id,Name from Account];

        if(!accList.isEmpty()){

        for(Integer i = 0; i<20;i++){

            contact c = new contact(FirstName = 'fname'+i,LastName='lName' +i

            );
        }

    }
}
}
