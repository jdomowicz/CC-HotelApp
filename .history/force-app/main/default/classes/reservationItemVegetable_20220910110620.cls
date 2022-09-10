public class reservationItemVegetable implements reservationLineI {

    public Reservation_line_item__c reservationItem() {

      return new Reservation_line_item__c(
            Product__c = [Select Id from PricebookEntry WHERE Product2.isApexDefaultBreakfast__c = true AND Pricebook2.IsStandard = true AND Name = 'Breakfast - Vegetarian' LIMIT 1].Id
        );

    }
}
