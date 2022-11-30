public with sharing class HotelMapMarker implements IMapMarker{


    public list<sObject> getRecords(){

        return [SELECT Id,Name,Country__c,city__c,zip_code__c,Street__c from Hotel__c];
    }

    public list<Object> wrapRecordForUI(list<sObject> sObjectRecords){


            for(sObject(Hotel__c) h: )


    }


}
