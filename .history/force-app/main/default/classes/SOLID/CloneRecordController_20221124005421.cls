public with sharing class CloneRecordController {

    /*
    This class is generic end will not end. It is coresponding to CloneRecord_Service(clone service is used only to instanciete CloneInterface) and implement cloneAccount or cloneOppty or any other class that implement CloneInterface.
    */
    // Pass the clone record id and class type!
    @AuraEnabled
    public static void cloneRecord(Id recordId, String ClassName) {

        Type cloneClassType = type.forName(ClassName);

        // Crete new instance of CloneInterface depending on cloneClassType variable
        CloneInterface CloneInterfaceInstance = (CloneInterface)cloneClassType.;

        // Instanciete CloneRecords_Service. CloneRecord_Service class contain constructor which instanciete CloneAccount/CloneOppty
        CloneRecords_Service cloneRecord = new CloneRecords_Service(CloneInterfaceInstance);
        cloneRecord.CloneRecord(recordId);

    }


    @AuraEnabled
    public static void cloneRelatedRecords(Id recordId, String ClassName) {

        Type cloneClassType = type.forName(ClassName);
        // Crete new instance of CloneInterface depending on cloneClassType variable
        CloneInterface CloneInterfaceInstance = (CloneInterface)cloneClassType.newInstance();
        // Instanciete CloneRecords_Service. CloneRecord_Service class contain constructor which instanciete CloneAccount/CloneOppty
        CloneRecords_Service cloneRecord = new CloneRecords_Service(CloneInterfaceInstance);
        cloneRecord.cloneRelatedRecords(recordId);

    }

}
