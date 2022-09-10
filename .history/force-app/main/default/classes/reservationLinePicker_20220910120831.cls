public with sharing class reservationLinePicker {

    public static reservationLineI reservationPrduc(String brekfatType){

        if (brekfatType == 'Non-Vegeterian'){

            return new reservationItemNonVegetable();
        }
        else{

            return new reservationItemVegetable();
        }

    }

}
