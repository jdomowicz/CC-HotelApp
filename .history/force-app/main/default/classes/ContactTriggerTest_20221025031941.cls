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


         //list of acconut for each contact
        list<Id> AccIds = new list<Id>();
        for(account a : [Select Id from Account LIMIT 2]){
            AccIds.add(a.Id);
        }

        system.debug(AccIds);

        list<contact> contactUpd = new list<contact>();

         //reparent each contact in acc0
        for(contact c: [Select Id,AccountId from Contact Where AccountId =: AccIds[0]]){

            c.AccountId = AccIds[1];
            contactUpd.add(c);
        }

        update contactUpd;

        list<Contact> updatedContact = [Select Id,AccountId from Contact Where AccountId =: AccIds[0]];
        list<Contact> updatedContact2 = [Select Id,AccountId from Contact Where AccountId =: AccIds[1]];

        system.debug(updatedContact.size());
        system.debug(updatedContact2.size());


        Account a = [Select Id,No_of_Contacts__c from Account where Id =: AccIds[0]];
        system.debug(a);

        Account b = [Select No_of_Contacts__c from Account where Id =: AccIds[1]];
         system.debug(b);

        System.assertEquals(0,a.No_of_Contacts__c,'No of contacts should be 0');

        list<contact> deleteContacts = [Select Id,AccountId from Contact Where AccountId =: AccIds[1]];

        system.debug(deleteContacts);

        delete deleteContacts;

        Account bafter = [Select No_of_Contacts__c from Account where Id =: AccIds[1]];

        System.assertEquals(0,bafter.No_of_Contacts__c,'No of contacts should be 0');


        list<contact> restoreContacts = [SELECT Id from Conctact where id In: deleteContacts ALL ROWS];
        system.debug(restoreContacts);

        undelete restoreContacts;

        Account afterundelete = [Select No_of_Contacts__c from Account where Id =: AccIds[1]];
    }


}
