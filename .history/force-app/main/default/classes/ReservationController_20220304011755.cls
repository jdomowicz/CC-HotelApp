public class ReservationController {

    // Create Default Reservation Item for new Reservation

    public static void createReservationItem(List<Reservation__c> reservations){

        List<Reservation_line_item__c> newReservations = new list<Reservation_line_item__c>();

        PricebookEntry defaultPricebook = [Select Id,Name,Product2Id,UnitPrice from PricebookEntry WHERE Product2Id = '01t7Q000000VIqvQAG'];


        list<Reservation__c> reservationQuery= [SELECT Id,Name,Guest_name__r.Name,Guest_name__r.Discount__c FROM Reservation__c WHERE Id IN: reservations];

        map<Id,Reservation__c> reservationMap = new map<Id,Reservation__c>(reservationQuery);

        for(Reservation__c r: reservations){

            Reservation_line_item__c rlineItem = new Reservation_line_item__c(
                Name = r.Name + ' - ' + r.Number_of_Days__c + ' stay. ' + reservationMap.get(r.Id).Guest_name__r.Name,
                Product__c = defaultPricebook.Product2Id,
                Reservation__c = r.Id,
                Quantity__c = r.Number_of_Days__c,
                Discount__c = reservationMap.get(r.Id).Guest_name__r.Discount__c,
                List_Price__c =  defaultPricebook.UnitPrice * r.Number_of_Days__c,
                Total_Price__c = (defaultPricebook.UnitPrice * r.Number_of_Days__c) * (1 - (reservationMap.get(r.Id).Guest_name__r.Discount__c/100))
            );
            newReservations.add(rlineItem);
        }

        insert newReservations;

    }



    public static void checkIfRoomAvailable(List<Reservation__c> reservations){


        map<Room__c,list<Reservation__c>> roomReservations = new map<Room__c,list<Reservation__c>>();

        for(reservations)

        for(Reservation__c r : reservations ){



        }



    }

}
