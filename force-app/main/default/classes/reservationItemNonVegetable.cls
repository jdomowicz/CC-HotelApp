public class reservationItemNonVegetable implements reservationLineI {

    public PricebookEntry reservationItem() {

        PricebookEntry i =  [Select Id,Name,Product2Id,UnitPrice from PricebookEntry WHERE Product2.isApexDefaultBreakfast__c = true AND Pricebook2.IsStandard = true AND Name = 'Breakfast - Non-Vegeterian' LIMIT 1];

        return i;

    }
}