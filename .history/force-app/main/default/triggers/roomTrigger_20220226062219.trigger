trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            for(Room__c r :Trigger.new){

                room

if(r.Room_Number__c > )

            }

        }
    }

}
