public class reservationItemVegetable implements reservationLineI {

    public Id reservationItem() {

        Id i;

        i = 
      return
        i = [Select Id from PricebookEntry WHERE Product2.isApexDefaultBreakfast__c = true AND Pricebook2.IsStandard = true AND Name = 'Breakfast - Vegetarian' LIMIT 1].Id

    }
}