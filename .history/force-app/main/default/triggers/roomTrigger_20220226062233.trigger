trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            for(Room__c r :Trigger.new){

                list<Room__c> rlist = 

if(r.Room_Number__c > )

            }

        }
    }

}
