public with sharing class IUMapMarkerController {
    

    @AuraEnabled
    public static list<Object> returnRecordsForUI(){
        try {
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}
