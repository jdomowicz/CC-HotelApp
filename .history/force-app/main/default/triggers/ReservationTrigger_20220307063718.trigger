trigger ReservationTrigger on Reservation__c (after insert, before insert) {


    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            // Create Reservation Item
            ReservationTriggerHandler.checkIfRoomAvailable(Trigger.New);

    }

        WHEN AFTER_INSERT {

            // Create Reservation Item
            ReservationTriggerHandler.createReservationItem(Trigger.New);
            ReservationTriggerHandler.afterInsertUpdateRoomAvailability()

    }

}

}