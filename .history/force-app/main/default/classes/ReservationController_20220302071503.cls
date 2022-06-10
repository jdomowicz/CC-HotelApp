public class ReservationController {

    public static void createReservationItem(List<Reservation__c> reservations){

        List<Reservation_line_item__c> newReservations = new list<Reservation_line_item__c>();

        PricebookEntry defaultPricebook= [Select Id,Name,Product2Id,UnitPrice from PricebookEntry WHERE Product2Id = '01t7Q000000VLv1QAG'];

        map<Id,Reservation__c>

        for(Reservation__c r: reservations){

            Reservation_line_item__c rlineItem = new Reservation_line_item__c(
                Name = r.Name + ' - ' + r.Number_of_Days__c + ' stay. ' + r.Guest_name__r.Name,
                Product__c = defaultPricebook.Product2Id,
                Reservation__c = r.Id,
                Quantity__c = r.Number_of_Days__c,
                Discount__c = r.Guest_name__r.Discount__c,
                List_Price__c =  defaultPricebook.UnitPrice * r.Number_of_Days__c
                //,Total_Price__c = (defaultPricebook.UnitPrice * r.Number_of_Days__c)*(1 - r.Guest_name__r.Discount__c)
            );
            newReservations.add(rlineItem);
        }

        insert newReservations;

    }

}
