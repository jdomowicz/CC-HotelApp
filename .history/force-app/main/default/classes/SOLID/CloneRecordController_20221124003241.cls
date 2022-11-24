public with sharing class CloneRecordController {

    /*
    This class is generic end will not end. It is coresponding to CloneRecord_Service(clone service is used only to instanciete CloneInterface) and implement cloneAccount or cloneOppty or any other class that implement CloneInterface.
    */
    // Pass the clone record id and class type!
    @AuraEnabled
    public static void cloneRecord(Id recordId, String ClassName) {

        Type cloneClassType = type.forName(ClassName);
        CloneRecords_Service cloneService = (CloneRecords_Service)cloneClassType.newInstance();
        

    }
}
