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
            location.Country = h.MailingCountry;
            location.Street = h.MailingStreet;
            location.PostalCode = h.MailingState;


            marker.description = 'This is Hotel description.';
            marker.title = h.Name;
            marker.location = location;

            mapMarkersList.add(marker);

            }

            return mapMarkersList;


    }


}
