trigger hotelTrigger on Hotel__c (after insert) {

     switch on Trigger.operationType {

        WHEN AFTER_INSERT {

            // Create Standard Rooms
            roomMaintenance.generateRooms(Trigger.New);
            ReservationTriggerHandler.afterInsertUpdateRoomAvailability(Trigger.New);
            ReservationTriggerHandler.updateContactDiscount(Trigger.New);

    }

}

}