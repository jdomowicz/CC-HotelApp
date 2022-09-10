public with sharing class reservationLinePicker {


    reservationItemStayDefault

    public static reservationLineI reservationLineProduct(String brekfatType){

        if (brekfatType == 'Non-Vegeterian'){

            return new reservationItemNonVegetable();
        }
        else{

            return new reservationItemVegetable();
        }

    }

}
