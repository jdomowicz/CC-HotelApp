public class roomTriggerHandler {


    public static void beforeInsert(list<Room__c> roomList) {

        // Create map with Hotels and Rooms list
        Map<Id,List<room__c>> hotelWithRoom=new Map<Id,List<room__c>>();

        For(Hotel__c acc :[Select Id,total_rooms__c, (SELECT Room_Number__c from Rooms__r) from 
                   Hotel__c WHERE Id = 'a007Q000004E0lQQAS']){

        hotelWithRoom.put(acc.Id,acc.rooms__r);
        }


    }
}
