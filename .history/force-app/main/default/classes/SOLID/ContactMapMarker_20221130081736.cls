public with sharing class ContactMapMarker implements IMapMarker{

    public list<sObject> getRecords(){

        return [SELECT Id, Name, MailingCity, MailingState, MailingPostalCode, MailingCountry, MailingStreet FROM Contact];
    }

    public list<Object> wrapRecordForUI(list<sObject> sObjectRecords){

        list<MapMarker> mapMarkersList = new list<MapMarker>();

            for(Contact h: (list<Contact>)sObjectRecords){

            MapMarker marker = new MapMarker();
            MapLocation location = new MapLocation();

            location.City = h.City__c;
            location.Country = h.Country__c;
            location.Street = h.Street__c;
            location.PostalCode = h.zip_code__c;


            marker.description = 'This is Hotel description.';
            marker.title = h.Name;
            marker.location = location;

            mapMarkersList.add(marker);

            }

            return mapMarkersList;


    }


}
