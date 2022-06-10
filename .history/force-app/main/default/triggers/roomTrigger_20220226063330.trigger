trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {
            
            list<Hotel__c> rlist = [Select id,total_rooms__c from Hotel__c WHERE id IN : Trigger.New];

            for(Room__c r :Trigger.new){


      //  if(r.Room_Number__c > )


        }
    }

}
}
