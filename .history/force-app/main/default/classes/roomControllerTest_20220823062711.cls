
@isTest
public with sharing class roomControllerTest {


    @TestSetup
    static void makeData(){

    Hotel__c hotel = new Hotel__c(Name = 'Test Hotel',Country__c = 'Poland',City__c = 'Wroclaw');
    inster hotel;

    Room__c r1 = new Room__c(Name = 'Test Single Room 1', Hotel__c = h1.Id,Max_Number_of_Guests__c = 5);
    insert r1;

    }

    static testMethod void roomControllerTest() {


    }
}
