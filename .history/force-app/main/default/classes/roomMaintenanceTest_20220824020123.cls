@isTest
public with sharing class roomMaintenanceTest {



    @TestSetup
    static void makeData(){
        
        Hotel__c testHotel = new Hotel__c(Name = 'Test Hotel');
    }


    static testMethod void roomMaintenanceTest() {

    }
}