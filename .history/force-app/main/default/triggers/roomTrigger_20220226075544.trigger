trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            map<Id,Hotel__c

    for(Room__c r :Trigger.new){

        Hotel__c hotel = [Select Id,Name,total_rooms__c from Hotel__c WHERE Id =: r.Hotel__c];

        if(r.Room_Number__c <= hotel.total_rooms__c){

            r.addError('Room with this number already exisit! Please use number > ' + hotel.total_rooms__c); // prevent create

        }

        }
    }

}
}
