public with sharing class CloneRecordController {

    /*
    This class is generic end will not end. It is coresponding to CloneRecord_Service()
    */
    // Pass the clone record id and class type!
    @AuraEnabled
    public static void cloneRecord(Id recordId, String ClassName) {

        Type cloneClassType = type.forName(ClassName);
        CloneRecords_Service cloneService = (CloneRecords_Service)cloneClassType.newInstance();

    }
}
