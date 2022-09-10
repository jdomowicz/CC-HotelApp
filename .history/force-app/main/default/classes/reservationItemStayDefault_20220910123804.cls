public with sharing class reservationItemStayDefault implements reservationLineI{

      public Id reservationItem() {

        Id i =  [Select Product2Id from PricebookEntry WHERE Product2.isApexDefaultReservation__c = true AND Pricebook2.IsStandard = true LIMIT 1].Product2Id;

        return i;

    }
}
