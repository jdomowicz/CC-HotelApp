public with sharing class roomTriggerHandler {


    public roomTriggerHandler() {

        for(Room__c r :Trigger.new){
            hotelList.add(r.Hotel__c);
            }
    
            list<Hotel__c> hList = [Select Id,total_rooms__c from Hotel__c WHERE Id IN: hotelList];
    
            Map<Id, Hotel__c> hotelMap = new Map<Id, Hotel__c>(hList);
    
            for(Room__c rc : Trigger.new){
    
                if(rc.Room_Number__c <= hotelMap.get(rc.Hotel__c).total_rooms__c){
    
                    rc.addError('Room with this number already exisit! Please use number > ' + hotelMap.get(rc.Hotel__c).total_rooms__c); // prevent create
                }
    
            }
    }
}
