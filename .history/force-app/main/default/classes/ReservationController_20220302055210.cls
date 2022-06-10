public class ReservationController {


    public static void createReservationItem(List<Reservation__c> reservations){


        PricebookEntry defaultPricebook= [Select Id,Name,Product2Id,UnitPrice from PricebookEntry WHERE Product2Id = '01t7Q000000VLv1QAG'];

        for(Reservation__c r: reservations){

            Reservation_line_item__c rlineItem = new Reservation_line_item__c(
                Name = r.Name + ' - ' + r.Number_of_Days__c + ' stay. ' + r.Owner,
                Product__c = defaultPricebook.Product2Id,
                Quantity__c = r.Number_of_Days__c,
                Discount__c = 0,
                List_Price__c=  defaultPricebook.UnitPrice * r.Number_of_Days__c,
                Total_Price__c = (defaultPricebook.UnitPrice * r.Number_of_Days__c)*
            );
        }

    }

}
