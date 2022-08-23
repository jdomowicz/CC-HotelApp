
@isTest
public with sharing class roomControllerTest {


    @TestSetup
    static void makeData(){

    Hotel__c h1 = new Hotel__c(Name = 'Test Hotel',Country__c = 'Poland',City__c = 'Wroclaw');
    inster h1;

    Room__c r1 = new Room__c(Name = 'Test Single Room 1', Hotel__c = h1.Id);
    insert r1;


    }
    public roomControllerTest() {

    }
}
