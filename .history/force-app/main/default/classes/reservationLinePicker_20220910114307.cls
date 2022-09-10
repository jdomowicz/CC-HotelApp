public with sharing class reservationLinePicker {

    reservationLineI lineItemType;

    public reservationLineI reservationItem(String brekfatType){

        if (brekfatType == 'Non-Vegeterian'){

            return new reservationItemNonVegetable();
        }
        else{

            return new reservationItemNonVegetable();
        }

    }

}
