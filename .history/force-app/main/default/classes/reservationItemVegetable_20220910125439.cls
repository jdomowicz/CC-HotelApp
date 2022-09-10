public class reservationItemVegetable implements reservationLineI {

    public priceboo reservationItem() {

        Id i =  [Select Product2Id from PricebookEntry WHERE Product2.isApexDefaultBreakfast__c = true AND Pricebook2.IsStandard = true AND Name = 'Breakfast - Vegetarian' LIMIT 1].Product2Id;

        return i;

    }
}
