public class roomTriggerHandler {


    public static void beforeInsert(list<Room__c> roomList) {

        // Create map with Hotels and Rooms list
        Map<Id,List<room__c>> hotelWithRoom=new Map<Id,List<room__c>>();


        // Create list of Hotel Ids
        set<Id> hotelIds = new set<Id>();

            for(room__c rooms : roomList){
            hotelIds.add(rlist.Hotel__c);
            }



        For(Hotel__c acc :[Select Id,total_rooms__c, (SELECT Room_Number__c from Rooms__r) FROM
                   Hotel__c WHERE Id IN: roomList.]){

        hotelWithRoom.put(acc.Id,acc.rooms__r);
        }


    }
}
