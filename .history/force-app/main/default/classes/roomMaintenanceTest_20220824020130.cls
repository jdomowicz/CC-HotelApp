@isTest
public with sharing class roomMaintenanceTest {



    @TestSetup
    static void makeData(){
        
        Hotel__c testHotel = new Hotel__c(Name = 'Test Hotel',City__c='Wroclaw');
    }


    static testMethod void roomMaintenanceTest() {

    }
}