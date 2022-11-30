public with sharing class ContactMapMarker implements IMapMarker{

    public list<sObject> getRecords(){

        return [SELECT Id, Name, MailingCity, MailingState, MailingPostalCode, MailingCountry, MailingStreet FROM Contact];
    }

    public list<Object> wrapRecordForUI(list<sObject> sObjectRecords){

        list<MapMarker> mapMarkersList = new list<MapMarker>();

            for(Contact c: (list<Contact>)sObjectRecords){

            MapMarker marker = new MapMarker();
            MapLocation location = new MapLocation();

            location.City = c.MailingCity;
            location.Country = c.MailingCountry;
            location.Street = c.MailingStreet;
            location.PostalCode = c.MailingPostalCode;


            marker.description = 'This is Hotel description.';
            marker.title = c.Name;
            marker.location = location;

            mapMarkersList.add(marker);

            }

            return mapMarkersList;


    }


}
