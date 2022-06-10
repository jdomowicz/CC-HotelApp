public class GuestController {

    public static List<Contact> discountCalculator(List<Contact> contacts){

        map<Id,Integer> contactMap = new map<Id,Integer>();

        AggregateResult[] reservatioNumber = [SELECT count(id) reservations_count, Guest_name__c, FROM Reservation__c WHERE Check_In_Date__c = LAST_N_DAYS:365 AND Guest_name__c IN:contacts GROUP BY Guest_name__c,];

        for(AggregateResult agg: reservatioNumber){

            //contactMap.put((Id)agg.get('Guest_name__r.Id'),(Integer)agg.get('reservations_count'));
            contactMap.put((Id)agg.get('Guest_name__r.Id'),(Integer)agg.get('reservations_count'));
            system.debug(contactMap);
        }

            system.debug(contactMap);

            /*
        List<Contact> contactUpdateList = new list<Contact>();

        for(Contact c : contactMap.keySet()){

           if((Integer) contactMap.get(c.Id) > 5 ){
            c.Discount__c = 30;

           }
           else if((Integer) contactMap.get(c.Id) > 3 ){
            c.Discount__c = 20;

           }
           else if((Integer) contactMap.get(c.Id) > 1 ){
            c.Discount__c = 10;
           }
           else {
            c.Discount__c = 0;
           }

       contactUpdateList.add(c);
    }


    return contactUpdateList;

    */

    return null;
}

}
