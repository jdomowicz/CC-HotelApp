public with sharing class UIMapWrapperService {

    private static map<String,Type> objectAndUITypeToWrapperImpl = new map<String,Type>{

        'ContactMapMarker' => ContactMapMarker.class,
        'Hotel__cMapMarker' => HotelMapMarker.class

    };

    public static list<sObject> getRecords(String objectType, String uiType){

        IMapMarker wrapperInterface = (IMapMarker)objectAndUITypeToWrapperImpl.get(objectType+'MapMarker').newInstance();
        return wrapperInterface.getRecords();

    }


    public static list<Object> wrapRecordForUI(list<sObject> sObjectRecords){

       IMapMarker wrapperInterfaceforUI = (IMapMarker)objectAndUITypeToWrapperImpl.get(sObjectRecords[0].getSObjectType() + 'MapMarker').newInstance();
       list<Object> returnRecordsForUI = wrapperInterfaceforUI.wrapRecordForUI(sObjectRecords);

       return returnRecordsForUI;

    }

    }


