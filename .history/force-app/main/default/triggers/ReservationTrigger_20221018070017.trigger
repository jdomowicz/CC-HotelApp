trigger ReservationTrigger on Reservation__c (after insert, before insert, before delete) {


    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            // Check if room is available
            ReservationTriggerHandler.checkIfRoomAvailable(Trigger.New);

    }

        WHEN AFTER_INSERT {

            // Create Reservation Item
            ReservationTriggerHandler.createReservationItem(Trigger.New);
            ReservationTriggerHandler.afterInsertUpdateRoomAvailability(Trigger.New);
            ReservationTriggerHandler.updateContactDiscount(Trigger.New);

    }

        WHEN BEFORE_DELETE {
            // Check if cancelation fee is required and if its payed
            ReservationTriggerHandler.beforeDeleteReservation(Trigger.old);

    }
}

}