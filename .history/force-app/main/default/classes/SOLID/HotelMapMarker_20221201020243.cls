public with sharing class HotelMapMarker implements IMapMarker{

    public list<sObject> getRecords(){

        return [SELECT Id,Name,Country__c,city__c,zip_code__c,Street__c from Hotel__c];
    }

    public list<Object> wrapRecordForUI(list<sObject> sObjectRecords){

        list<MapMarker> mapMarkersList = new list<MapMarker>();

            for(Hotel__c h: (list<Hotel__c>)sObjectRecords){

            MapMarker marker = new MapMarker();
           // MapLocation location = new MapLocation();

            marker.location.City = h.City__c;
            marker.location.Country = h.Country__c;
            marker.location.Street = h.Street__c;
            marker.location.PostalCode = h.zip_code__c;


            marker.description = 'This is Hotel description.';
            marker.title = h.Name;
            //marker.location = location;

            mapMarkersList.add(marker);

            }

            return mapMarkersList;


    }


}
