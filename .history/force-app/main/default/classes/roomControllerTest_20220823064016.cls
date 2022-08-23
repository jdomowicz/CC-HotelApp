
@isTest
public with sharing class roomControllerTest {

     public class FILTERSAPEX {
        public list<String> rooms;
        public String city;
        public String hotel;
        public String country;
        public String startDate;
        public String endDate;
        public String numberOfGuests;
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

        system.debug(filters)

      //  List<Room__c> rList =  roomController.roomDisplayList(filters);


    }
}
