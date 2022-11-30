public with sharing class IUMapMarkerController {


    /*
    This code mostlikely will never change. Its controller that run Factory Pattern class called UIMapWrapperService that decide which implementation of IMapMarker class implement.
    */

    @AuraEnabled
    public static list<Object> returnRecordsForUI(String objectType, String uiType) {

        list<Object> recordsforUI = UIMapWrapperService.wrapRecordForUI(UIMapWrapperService.getRecords(objectType,uiType));

        return recordsforUI;

    }

}
