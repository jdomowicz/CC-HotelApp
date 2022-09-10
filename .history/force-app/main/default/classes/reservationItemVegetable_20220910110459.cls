public class reservationItemVegetable implements reservationLineI {

    public Reservation_line_item__c reservationItem() {

       new Reservation_line_item__c(
            Product__c = [1]
        )

    }
}
