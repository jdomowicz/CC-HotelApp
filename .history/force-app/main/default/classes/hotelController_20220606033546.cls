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
    public static list<AggregateResult> cityList(String countryName){

        String countryName = 

        return  [SELECT City__c FROM Hotel__c WHERE City__c <> NULL AND Country__c =: GROUP BY City__c  ];

    }

}
