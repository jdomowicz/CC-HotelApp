trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

    list<Hotel__c> hotelList = new list<Hotel__c>();
    map<Id,Hotel__c> hotelMap = new map<Id,Hotel__c>();

    for(Room__c r :Trigger.new){

        hotelList.add(r.Hotel__r);






        

        Hotel__c hotel = [Select Id,Name,total_rooms__c from Hotel__c WHERE Id =: r.Hotel__c];

        if(r.Room_Number__c <= hotel.total_rooms__c){

            r.addError('Room with this number already exisit! Please use number > ' + hotel.total_rooms__c); // prevent create

        }

        }
    }

}
}
