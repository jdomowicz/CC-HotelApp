public class roomController {

    public class DATESRANGE{

    @AuraEnabled
    public String dateName {get;set;}
     @AuraEnabled
    public String dateValue {get;set;}

    }

    public class FILTERSAPEX {
        @AuraEnabled
        public list<String> rooms {get;set;}
        @AuraEnabled
        public String city {get;set;}
        @AuraEnabled
        public String hotel {get;set;}
        @AuraEnabled
        public String country {get;set;}
        //@AuraEnabled
        //public list<DATESRANGE> reservationDates {get;set;}

        @AuraEnabled
        public String startDate {get;set;}
        @AuraEnabled
        public String endDate {get;set;}

        @AuraEnabled
        public String numberOfGuests {get;set;}
        @AuraEnabled
        public Boolean available {get;set;}

}


    @AuraEnabled (cacheable = true)
    public static list<Room__c> roomDisplayList(FILTERSAPEX filters){

        FILTERSAPEX filterData = filters;
        String countryName;
        String cityName;
        String hotelName;
        Date hotelStartDate;
        Date hotelEndDate;

        list<String> logicList = new list<String>();
        String logicDatesList = '';
        String logic = '';
        String logicDate = '';
        String logicDate1 = '';
        String logicDate2 = '';
        String testString = '';

        String queryLogic;


        if(filterData != null){

            if(filterData.country != null){

                countryName = filterData.country;

                logicList.add('Hotel__r.Country__c =: countryName');

        }
            if(filterData.city != null){

                cityName = filterData.city;

                logicList.add('Hotel__r.City__c =: cityName');

            }
            if(filterData.hotel != null){

                hotelName = filterData.hotel;



            }

            testString = filterData.startDate + filterData.endDate;

            if(testString != ''){

                hotelStartDate = date.newInstance(Integer.valueOf(filterData.startDate.substring(0,4)),Integer.valueOf(filterData.startDate.substring(5,7)),Integer.valueOf(filterData.startDate.substring(8,10)));

                hotelEndDate = date.newInstance(Integer.valueOf(filterData.endDate.substring(0,4)),Integer.valueOf(filterData.endDate.substring(5,7)),Integer.valueOf(filterData.endDate.substring(8,10)));

                logicDatesList = '(Check_In_Date__c <=: hotelStartDate AND Check_out_Date__c >=: hotelEndDate) OR (Check_In_Date__c >=: hotelStartDate AND Check_out_Date__c <=: hotelEndDate)';

            }

            if(logicDatesList != ''){
            logicDate1 = ' AND Id NOT IN (Select Room__c FROM Reservation__c WHERE ' + logicDatesList + ' )';
            logicDate2 = ' Id NOT IN (Select Room__c FROM Reservation__c WHERE ' + logicDatesList + ' )';
            }

            else{

                logicDate1 = '';
                logicDate2 = '';
            }

                if(logicList.size()>0){

                    logic = ' WHERE ' + String.join(logicList, ' AND ') + logicDate1;
                }
                else{

                    logic = ' WHERE ' + logicDate2;
                }

        }


        queryLogic = 'Select Id,Hotel__r.Name,Hotel__r.City__c,Hotel__r.Country__c,Name, (SELECT Id, Name, Check_In_Date__c, Check_out_Date__c, Room__c FROM Reservations__r), Available__c,Type__c,Room_Number__c,photo_url__c,Max_Number_of_Guests__c FROM Room__c' + logic;

        list<Room__c> roomList = Database.query(queryLogic);

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
