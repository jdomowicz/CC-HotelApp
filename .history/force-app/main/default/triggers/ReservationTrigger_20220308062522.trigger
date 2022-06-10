trigger ReservationTrigger on Reservation__c (after insert, before insert) {


    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            // Check if room is available
            ReservationTriggerHandler.checkIfRoomAvailable(Trigger.New);

    }

        WHEN AFTER_INSERT {

            // Create Reservation Item
            ReservationTriggerHandler.createReservationItem(Trigger.New);
            ReservationTriggerHandler.afterInsertUpdateRoomAvailability(Trigger.New);

    }

    WHEN BEFORE_DELETE {

            // Check if cancelation fee is required and if its payed

    }
}

}