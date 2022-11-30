public with sharing class IUMapMarkerController {
    

    @AuraEnabled
    public static list<Object> returnRecordsForUI(String objectType, String uiType) {

        UIMapWrapperService.getRecords(objectType, uiType)
        
        UIMapWrapperService.wrapRecordForUI();



       
    }

}
