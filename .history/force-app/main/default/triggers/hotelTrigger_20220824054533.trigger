trigger hotelTrigger on Hotel__c (after insert) {

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

}