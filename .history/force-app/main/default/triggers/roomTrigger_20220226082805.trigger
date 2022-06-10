trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

    set<Id> hotelList = new set<Id>();

    for(Room__c r :Trigger.new){
        hotelList.add(r.Hotel__r);
        }

        Map<Id, Hotel__c> hotelMap = new Map<Id, Hotel__c>(hotelList);


        for(Room__c rc : Trigger.new){

            if(rc.Room_Number__c <= hotelMap.get(rc.Hotel__c).total_rooms__c){

                rc.addError('Room with this number already exisit! Please use number > ' + hotelMap.get(rc.Hotel__c).total_rooms__c); // prevent create
            }

        }

    }

}
}
