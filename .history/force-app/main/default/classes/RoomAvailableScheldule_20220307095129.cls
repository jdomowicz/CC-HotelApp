public with sharing class RoomAvailableScheldule implements Schedulable {


    public static String CRON_EXP = '0 30 10 1/1 * ? *';

public void execute(SchedulableContext ctx) {
      list<Room__c> endOfRent = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE occupied__c = true AND ID IN (SELECT Room__c from Reservation__c WHERE Check_out_Date__c = TODAY)];

    for(Room__c r : endOfRent){
        if(endOfRent.size() > 0){

        r.Available__c = true;
        r.occupied__c = false;
        }
    }


   }
}
