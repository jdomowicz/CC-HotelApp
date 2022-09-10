public class reservationItemVegetable implements reservationLineI {

    public Id reservationItem() {

      return 
            Product__c = [Select Id from PricebookEntry WHERE Product2.isApexDefaultBreakfast__c = true AND Pricebook2.IsStandard = true AND Name = 'Breakfast - Vegetarian' LIMIT 1].Id

    }
}
