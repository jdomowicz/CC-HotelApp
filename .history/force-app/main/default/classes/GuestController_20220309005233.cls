public class GuestController {

    public static List<Contact> guestTrailing12MonthReservations(List<Contact>){

        AggregateResult[] = [SELECT count(id) reservations_count, Guest_name__c FROM Reservation__c WHERE Check_In_Date__c = LAST_N_DAYS:365 AND Guest_name__cGROUP BY Guest_name__c];

    }
}
