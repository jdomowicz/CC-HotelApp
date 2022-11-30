public with sharing class HotelMapMarker implements IMapMarker{


    public list<sObject> getRecords(){

        return [SELECT Id,Name,Country__c,city__c,zip_code__c,Street__c from Hotel__c];
    }

    public list<Object> wrapRecordForUI(list<sObject> sObjectRecords){


            for(Hotel__c h: (Hotel__c)sObjectRecords){

            MapMarker marker = new MapMarker();
            MapLocation location = new MapLocation();

            location.City = h.City__c;
            location.Country = h.Country__c;
            location.Street = h.Street__c;
            location.PostalCode = h.zip_code__c;


            

            }

            return ;


    }


}
