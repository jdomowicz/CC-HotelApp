public with sharing class reservationLinePicker {

    public static reservationLineI reservationItem(String brekfatType){

        if (brekfatType == 'Non-Vegeterian'){

            

            return new reservationItemNonVegetable();
        }
        else{

            return new reservationItemVegetable();
        }

    }

}
