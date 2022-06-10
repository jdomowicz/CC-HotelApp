public class hotelController {


    public static void roomNumber() {
    list<Hotel__c> hotels = [Select Id,Name,Rooms_Available__c FROM Hotel__c];
    Map<Id, Hotel__c> hotelMap = new Map<Id, Hotel__c>(hotels);
    }

    @AuraEnabled (cacheable = true)
    public static list<AggregateResult> countryList(){

        return  [SELECT Country__c FROM Hotel__c WHERE Country__c <> NULL GROUP BY Country__c];

    }

        @AuraEnabled (cacheable = true)
    public static list<AggregateResult> countryList(){

        return  [SELECT Country__c FROM Hotel__c WHERE Country__c <> NULL GROUP BY Country__c];

    }

}
