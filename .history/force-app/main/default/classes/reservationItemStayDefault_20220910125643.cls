public with sharing class reservationItemStayDefault implements reservationLineI{

      public PricebookEntry reservationItem() {

        PricebookEntry i =  [Select Id,Name,Product2Id,UnitPrice from PricebookEntry WHERE Product2.isApexDefaultReservation__c = true AND Pricebook2.IsStandard = true LIMIT 1];

        return i;

    }
}
