public with sharing class ReservationController {

    @AuraEnabled (cacheable =true)
    public static list<Reservation__c> reservationList(list<String> rList) {

        return [SELECT Id,Name from Reservation__c WHERE Room__c IN: rList];

    }
}