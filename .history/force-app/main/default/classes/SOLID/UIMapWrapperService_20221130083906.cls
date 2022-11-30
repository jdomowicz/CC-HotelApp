public with sharing class UIMapWrapperService {

    public static map<String,Type> objectAndUITypeToWrapperImpl = new map<String,Type>{

        'ContactMapMarker' => ContactMapMarker.class,
        'Hotel__cMapMarker' => HotelMapMarker.class

    };

    public static list<sObject> getRecords(String objectType, String uiType){

        IMapMarker wrapperInterface = (IMapMarker)objectAndUITypeToWrapperImpl.get(objectType+'MapMarker').newInstance();
        return wrapperInterface.getRecords();

    }


    public static list<Object> wrapRecordForUI(list<sObject> sObjectRecords){

       IMapMarker wrapperInterfaceforUI = (IMapMarker)sObjectRecords[0].objectAndUITypeToWrapperImpl.get(sObjectRecords[]).newInstance();
       list<Object> returnRecordsForUI = wrapperInterfaceforUI.wrapRecordForUI(sObjectRecords);

       return returnRecordsForUI;

    }

    }


