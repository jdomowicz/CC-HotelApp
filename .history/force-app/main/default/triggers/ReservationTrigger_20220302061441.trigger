trigger ReservationTrigger on Reservation__c (after insert) {


    switch on Trigger.operationType {

        WHEN AFTER_INSERT {

            ReservationController.afterInsert(Trigger.New);

    }

}

}