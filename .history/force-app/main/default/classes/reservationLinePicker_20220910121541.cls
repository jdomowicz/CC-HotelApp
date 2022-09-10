public with sharing class reservationLinePicker {

    public static reservationLineI reservationLineProduct(){
        return new reservationItemStayDefault();
}

    public static reservationLineI reservationLineProduct(String brekfatType){

        if (brekfatType == 'Non-Vegeterian'){

            return new reservationItemNonVegetable();
        }
        else{

            return new reservationItemVegetable();
        }

    }

}
