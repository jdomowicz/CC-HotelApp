public with sharing class reservationLinePicker {

    reservationLineI lineItemType;

    public Reservation_line_item__c reservationItem(){

        Id result = lineItemType.reservationItem();

    }

}
