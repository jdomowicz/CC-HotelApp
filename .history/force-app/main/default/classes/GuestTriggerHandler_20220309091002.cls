public class GuestTriggerHandler {


    public static void updateContactDiscount(List<Reservation__c> contacts){

        List<Contact> contactsToUpdate = GuestController.discountCalculator(contacts);

        update contactsToUpdate;

    }

}
