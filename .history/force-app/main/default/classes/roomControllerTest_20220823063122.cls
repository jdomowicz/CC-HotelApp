
@isTest
public with sharing class roomControllerTest {


    @TestSetup
    static void makeData(){

    Hotel__c hotel = new Hotel__c(Name = 'Test Hotel',Country__c = 'Poland',City__c = 'Wroclaw');
    insert hotel;

    Room__c r1 = new Room__c(Name = 'Test Single Room 1', Hotel__c = hotel.Id,Max_Number_of_Guests__c = 5);
    insert r1;


    public class FILTERSAPEX {
   
        public list<String> rooms

        public String city {get;set;}
        @AuraEnabled
        public String hotel {get;set;}
        @AuraEnabled
        public String country {get;set;}
        @AuraEnabled
        public String startDate {get;set;}
        @AuraEnabled
        public String endDate {get;set;}
        @AuraEnabled
        public String numberOfGuests {get;set;}

    }

    static testMethod void roomControllerTest() {

        List<Room__c> rList =  roomController.roomDisplayList();


    }
}
