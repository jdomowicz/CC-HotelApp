public class reservationItemNonVegetable implements reservationLineI {

    public Id reservationItem() {

      return Id i =
            Product__c = [Select Id from PricebookEntry WHERE Product2.isApexDefaultBreakfast__c = true AND Pricebook2.IsStandard = true AND Name = 'Breakfast - Non-Vegeterian' LIMIT 1].Id
        );

    }
}
