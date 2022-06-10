public class GuestTriggerHandler {


    public static void updateContactDiscount(List<Contact> contacts){


        List<Contact> contacts= GuestController.discountCalculator(contacts);


    }

}
