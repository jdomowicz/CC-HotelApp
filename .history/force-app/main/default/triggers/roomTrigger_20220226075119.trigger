trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

       list<Hotel__c> hotel = [Select Id,Name,total_rooms__c from Hotel__c WHERE Id IN: Trigger.new.Hotel__c];

       for(list<Room__c> r :Trigger.new){

        

        for(room__c rs : r){

        if(rs.Room_Number__c <= hotel.total_rooms__c){

            rs.addError('Room with this number already exisit! Please use number > ' + hotel.total_rooms__c); // prevent create

        }

        }
    }
    }

}
}
