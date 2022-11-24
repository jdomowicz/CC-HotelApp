public with sharing class CloneRecordController {


    @AuraEnabled
    public static string methodName(){
        try {
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    public static void cloneRecord(Id recordId, String ClassName) {

    }
}
