trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

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
