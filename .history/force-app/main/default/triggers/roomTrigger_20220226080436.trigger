trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

    list<Hotel__c> hotelList = new list<Hotel__c>();

    for(Room__c r :Trigger.new){
        hotelList.add(r.Hotel__r);

        }

        Map<Id, Hotel__c> hotelMap = new Map<Id, Hotel__c>(hotelList);


        for(room__c rc : Trigger.new){

            if(rc.Room_Number__c <= hotelMap.get(rc.Hotel__c).total_rooms__c){

                rc.addError('Room with this number already exisit! Please use number > ' + hotelMap.get(rc.Hotel__c).total_rooms__c); // prevent create
            }

        }

    }

}
}
