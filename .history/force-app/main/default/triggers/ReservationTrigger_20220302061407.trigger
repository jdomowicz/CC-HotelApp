trigger ReservationTrigger on Reservation__c (after insert) {


    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            roomTriggerHandler.beforeInsert(Trigger.New);

    }
        WHEN AFTER_UPDATE {

            roomTriggerHandler.afterUpdate(Trigger.New,Trigger.oldMap);

    }
        WHEN AFTER_INSERT {

            roomTriggerHandler.afterInsert(Trigger.New);

    }

}

}