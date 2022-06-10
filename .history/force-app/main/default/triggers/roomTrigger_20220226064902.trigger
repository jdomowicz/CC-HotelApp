trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            for(Room__c r :Trigger.new){


        if(r.Room_Number__c > = r.Hotel__r.total_rooms__c)


        }
    }

}
}
