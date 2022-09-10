public with sharing class reservationLinePicker {

    reservationLineI lineItemType;

    public reservationLineI reservationItem(String brekfatType){

        if (brekfatType == 'Non-Vegeterian'){

            return mreservationItemNonVegetable();
        }
        else{

            return reservationItemNonVegetable();
        }

    }

}
