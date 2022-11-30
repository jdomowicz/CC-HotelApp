public with sharing class UIMapWrapperService {

    public static map<String,Type> objectAndUITypeToWrapperImpl = new map<String,Type>{

        'ContactMapMarker' => ContactMapMarker.class,
        'Hotel__cMapMarker' => HotelMapMarker.class

    };

    public list<sObject> getRecords(String objectType, String uiType){

        IMapMarker wrapperInterface = (IMapMarker)objectAndUITypeToWrapperImpl.get(objectType+'MapMarker').newInstance();
        return wrapperInterface.getRecords();

    };


    }


