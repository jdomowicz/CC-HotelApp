public with sharing class CloneRecordController {


    @AuraEnabled
    public static void cloneRecord(Id recordId, String ClassName) {

        Type cloneClassType = type.forName(ClassName)

    }
}
