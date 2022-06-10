public class roomTriggerHandler {


    public static void beforeInsert(list<Room__c> roomList) {

        // Create map with Hotels and Rooms list
        Map<Id,List<room__c>> hotelWithRoom=new Map<Id,List<room__c>>();


        // Create list of Hotel Ids
        set<Id> hotelIds = new set<Id>();

            for(room__c room : roomList){
            hotelIds.add(room.Hotel__c);
            }



        For(Hotel__c hotel :[Select Id,total_rooms__c, (SELECT Room_Number__c from Rooms__r) FROM
                   Hotel__c WHERE Id IN: roomList.]){

        hotelWithRoom.put(hotel.Id,hotel.rooms__r);
        }


    }
}
