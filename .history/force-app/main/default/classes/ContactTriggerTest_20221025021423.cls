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
    public static void afterInsertHandlerTest() {

       list<contact> cList = new List<contact>();

       list<account> accList = [Select Id,No_of_Contacts__c,Name from Account];

        for(account a : accList){

        for(Integer i = 0; i<20;i++){

            contact c = new contact(FirstName = 'fname'+i,LastName='lname' +i,AccountId = a.Id);
            cList.add(c);
        }
    }

        System.assertEquals(accList.size(),5,'This list should have size 5');

        Decimal allContacts = 0;
        for(account a:accList){

            allContacts =+ a.No_of_Contacts__c;
        }
        System.assertEquals(allContacts,0,'No of contacts should be 0');

         // Perform test
        Test.startTest();
        insert cList;
        Test.stopTest();

        allContacts = 0;

        for(account a: [select Id,No_of_Contacts__c from Account]){

            allContacts = allContacts + a.No_of_Contacts__c;

        }
         System.assertEquals(100,allContacts,'No of contacts should be 100');


        Id AccId = [Select ]

    }


}
