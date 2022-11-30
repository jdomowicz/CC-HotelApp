public with sharing class IUMapMarkerController {
    

    @AuraEnabled
    public static list<Object> returnRecordsForUI(String objectType, String uiType) {
        

        list<Object> recordsforUI = UIMapWrapperService.wrapRecordForUI(UIMapWrapperService.getRecords);



       
    }

}
