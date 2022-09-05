public with sharing class ReservationController {
    
    
    @AuraEnabled
    public static string methodName(){
        try {
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    public static list<Reservation__c> reservationList() {

    }
}
