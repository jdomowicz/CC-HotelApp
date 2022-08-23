
@isTest
public with sharing class roomControllerTest {

    public class FILTERSAPEX {
        @AuraEnabled
        public list<String> rooms {get;set;}
        @AuraEnabled
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

    @TestSetup
    static void makeData(){

    Hotel__c hotel = new Hotel__c(Name = 'Test Hotel',Country__c = 'Poland',City__c = 'Wroclaw');
    insert hotel;

    Room__c r1 = new Room__c(Name = 'Test Single Room 1', Hotel__c = hotel.Id,Max_Number_of_Guests__c = 5);
    insert r1;

    }


    static testMethod void roomControllerTest() {

        FILTERSAPEX filters = new FILTERSAPEX();

        filters.city = 'Wroclaw';
        filters.country = 'Poland';

        system.debug(filters);


        roomController rc = new roomController();

        rc.roomDisplayList(FILTERSAPEX filters);

    }
}
