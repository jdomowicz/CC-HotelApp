public with sharing class UIMapWrapperService {

    public static map<String,Type> objectAndUITypeToWrapperImpl = new map<String,Type>{

        'Contact' => ContactMapMarker.class,
        'Hotel__c' => HotelMapMarker.class

    };

    public list<sObject> getRecords(String objectType, String uiType){

        IMapMarker wrapperInterface = ()

    };


    }


