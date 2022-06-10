trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            for(Room__c r :Trigger.new){

                list<Hotel__c> rlist = [Select id from Hotel__c H];

if(r.Room_Number__c > )

            }

        }
    }

}
