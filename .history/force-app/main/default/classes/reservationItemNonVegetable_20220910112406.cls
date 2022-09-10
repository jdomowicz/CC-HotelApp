public class reservationItemNonVegetable implements reservationLineI {

    public Id reservationItem() {

    Id i =  [Select Id from PricebookEntry WHERE Product2.isApexDefaultBreakfast__c = true AND Pricebook2.IsStandard = true AND Name = 'Breakfast - Non-Vegeterian' LIMIT 1].Id;

        reeturn i;

    }
}
