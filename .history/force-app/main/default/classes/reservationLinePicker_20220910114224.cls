public with sharing class reservationLinePicker {

    reservationLineI lineItemType;

    public Reservation_line_item__c reservationItem(String brekfatType){

        if (brekfatType == 'Non-Vegeterian'){

            return reservationItemNonVegetable();
        }
        else{

            return reservationItemNonVegetable();
        }

    }

}
