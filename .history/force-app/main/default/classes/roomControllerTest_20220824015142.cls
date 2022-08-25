@isTest
public with sharing class roomControllerTest {

    @TestSetup
    static void makeData(){

    Hotel__c hotel = new Hotel__c(Name = 'Test Hotel',Country__c = 'Poland',City__c = 'Wroclaw');
    insert hotel;

    Room__c r1 = new Room__c(Name = 'Test Single Room 1', Hotel__c = hotel.Id,Max_Number_of_Guests__c = 5);
    insert r1;

    Room__c r2 = new Room__c(Name = 'Test Single Room 2', Hotel__c = hotel.Id,Max_Number_of_Guests__c = 5, Type__c = 'Double',Room_Number__c = 2);
    insert r2;

    }

    static testMethod void roomControllerTest() {

        //Test rooms with all data

        roomController.FILTERSAPEX filters = new roomController.FILTERSAPEX();

        filters.city = 'Wroclaw';
        filters.country = 'Poland';
        filters.startDate = '2022-08-24';
        filters.endDate = '2022-08-28';
        filters.numberOfGuests = '5';
        filters.rooms = new List<String>{'Double'};
        filters.hotel = 'Test Hotel';


        list<Room__c> rTest = roomController.roomDisplayList(filters);


        //Test rooms without type data

        roomController.FILTERSAPEX filtersWithoutType = new roomController.FILTERSAPEX();

        filtersWithoutType.city = 'Wroclaw';
        filtersWithoutType.country = 'Poland';
        filtersWithoutType.numberOfGuests = '5';
        filtersWithoutType.hotel = 'Test Hotel';

        list<Room__c> rTest2 = roomController.roomDisplayList(filtersWithoutType);


        //Test other return methods
        List<Hotel__c> hList = [SELECT Id From Hotel__c];


       list<Room__c> roomList = roomController.roomList(hlist);
       list<Room__c> available = roomController.availableRooms(hlist);
       list<Room__c> occupied = roomController.occupiedRooms(hlist);
       list<Room__c> endReservation = roomController.endReservation();



    }
}
