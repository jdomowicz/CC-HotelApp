trigger ReservationTrigger on Reservation__c (after insert) {


    switch on Trigger.operationType {

        WHEN AFTER_INSERT {

            // Create Reservation Item
            ReservationController.createReservationItem(Trigger.New);

    }

}

}