public with sharing class RoomAvailableScheldule implements Schedulable {


    public static String CRON_EXP = '0 0 0 3 9 ? 2022';

public void execute(SchedulableContext ctx) {
      list<Room__c> endOfRent = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE occupied__c = true AND ID IN (SELECT Room__c from Reservation__c WHERE Check_out_Date__c = TODAY)];

    for(Room__c r : endOfRent){


        
    }


   }
}
