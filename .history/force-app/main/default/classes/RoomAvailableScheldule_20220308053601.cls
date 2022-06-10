public with sharing class RoomAvailableScheldule implements Schedulable {


public void execute(SchedulableContext ctx) {

      list<Room__c> endOfRentListUpdate = new List<Room__c>();

      list<Room__c> endOfRent = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE occupied__c = true AND ID IN (SELECT Room__c from Reservation__c WHERE Check_out_Date__c = TODAY)];

      list<Room__c> startOfRent = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE occupied__c = true AND ID IN (SELECT Room__c from Reservation__c WHERE Check_In_Date__c = TODAY)];

      if(endOfRent.size() > 0){
    for(Room__c r : endOfRent){

        r.Available__c = true;
        r.occupied__c = false;

        toUpdateList.add(r);
        }
    }

         if(startOfRent.size() > 0){
    for(Room__c r : startOfRent){

        r.Available__c = true;
        r.occupied__c = false;

        toUpdateList.add(r);
        }
    }

    update toUpdateList;

   }
}
