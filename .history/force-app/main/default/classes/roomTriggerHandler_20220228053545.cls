public class roomTriggerHandler {


    public static void beforeInsert(list<Room__c> roomList) {

        // Create map with Hotels and Rooms list
        Map<Id,List<room__c>> hotelWithRoom=new Map<Id,List<room__c>>();


        // Create list of Hotel Ids
        set<Id> hotelIds = new set<Id>();

            for(room__c room : roomList){
            hotelIds.add(room.Hotel__c);
            }

        // Populate map with Hotel Ids and List of Rooms
        For(Hotel__c hotel :[Select Id,total_rooms__c, (SELECT Room_Number__c from Rooms__r) FROM
                   Hotel__c WHERE Id IN: hotelIds]){

        hotelWithRoom.put(hotel.Id,hotel.rooms__r);
        }

        for(Room__c rc :roomList ){

            for(room__c dupCheck : hotelWithRoom.get(rc.Hotel__c)){

                if(rc.Room_Number__c == dupCheck.Room_Number__c){

                rc.addError('This room number already exisit: ' + rc.Room_Number__c + '. Please choose different number.'); // Prevent Create
                }
                else if (rc.Room_Number__c <=0){

                rc.addError('Room Number cannot be negative: ' + rc.Room_Number__c + '. Please choose different number.'); // Prevent Create

                }

            }

        }
    }



    public static void afterUpdate(list<Room__c> updateRecord ,list<Room__c> oldMapValue) {


        //Create Apex Class to handle Service Rooms List
        //List of all hotels that needs to be updated
        set<Id> underServiceUpdate = new set<Id>();
        set<Id> rentedUpdate = new set<Id>();

        for(room__c r : updateRecord){

            if(r.service__c == true && oldMapValue.get(r.Id).service__c == false){
            underServiceUpdate.add(r.Hotel__c);
            }
            else if(r.occupied__c	== true &&  oldMapValue.get(r.Id).occupied__c == false){



            }

        }





    }
}