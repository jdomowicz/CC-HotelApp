@isTest
public with sharing class roomMaintenanceTest {

    @TestSetup
    static void makeData(){

        Hotel__c testHotel = new Hotel__c(Name = 'Test Hotel',City__c='Wroclaw',Country__c='Poland');
        insert testHotel;
    }

    static testMethod void roomMaintenanceTest() {

        list<Hotel__c> hList = [SELECT Id,Name From Hotel__c];
        roomMaintenance.generateRooms(hList);

        list<Room__c> rommList = [SELECT Id, Name,jacuzzi__c,Type__c,Mini_Bar__c,Air_Condition__c,tv__c,Room_Number__c,Hotel__c from Room__c];

        Asse


    }
}