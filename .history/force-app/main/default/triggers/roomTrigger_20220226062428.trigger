trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            for(Room__c r :Trigger.new){

        list<Hotel__c> rlist = [Select id,total_rooms__c from Hotel__c WHERE ID IN : Trigger.New];

if(r.Room_Number__c > )

            }

        }
    }

}
