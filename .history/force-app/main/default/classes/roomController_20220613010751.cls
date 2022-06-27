public class roomController {

    public class FILTERSAPEX {
        @AuraEnabled
        public list<String> rooms {get;set;}
        @AuraEnabled
        public String city {get;set;}
        @AuraEnabled
        public String hotel {get;set;}
        @AuraEnabled
        public String country {get;set;}
      //  @AuraEnabled
      //  public list<String> reservationDates {get;set;}
      //  @AuraEnabled
      //  public String numberOfGuests {get;set;}
      //  @AuraEnabled
      //  public Boolean available {get;set;}

}


    @AuraEnabled (cacheable = true)
    public static list<Room__c> roomDisplayList(FILTERSAPEX filters){

        FILTERSAPEX filterData = 

        String CountryName = 'United Kingdom';

        if(filters != null){

                 CountryName = filters.country;
        }
            else {
                 CountryName = 'United States';

        }

        list<Room__c> roomList = [Select Id,Hotel__r.Name,Hotel__r.City__c,Hotel__r.Country__c,Name,Available__c,Type__c,Room_Number__c,photo_url__c,Max_Number_of_Guests__c FROM Room__c WHERE Hotel__r.Country__c =: CountryName];

        return roomList;
    }


    public static list<Room__c> roomList(list<Hotel__c> hlist){

        list<Room__c> roomList = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE Hotel__c IN: hlist];

        return roomList;
    }

    public static list<Room__c> availableRooms(list<Hotel__c> hlist){

        list<Room__c> availableRooms = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE Hotel__c IN: hlist AND Available__c = true];

        return availableRooms;
    }

    public static list<Room__c> occupiedRooms(list<Hotel__c> hlist){

        list<Room__c> occupiedRooms = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE Hotel__c IN: hlist AND occupied__c = true];
        return occupiedRooms;
    }

    public static list<Room__c> endReservation(){

        list<Room__c> endReservation = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE occupied__c = true AND ID IN (SELECT Room__c from Reservation__c WHERE Check_out_Date__c = TODAY)];

        return endReservation;

    }

}
