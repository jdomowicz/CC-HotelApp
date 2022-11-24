public with sharing class CloneRecordSolidController {

    /*
    This class is generic end will not end. It is coresponding to CloneRecord_Service(clone service is used only to instanciete CloneInterface) and implement cloneAccount or cloneOppty or any other class that implement CloneInterface.
    */
    // Pass the clone record id and class type!
    @AuraEnabled
    public static sObject cloneRecord(Id recordId, String className) {

        Type cloneClassType = type.forName(className);

        // Crete new instance of CloneInterface depending on cloneClassType variable
        // CloneInterface CloneInterfaceInstance = (CloneInterface)cloneAccount;
        // CloneInterface CloneInterfaceInstance = (CloneInterface)cloneOppty;
        CloneInterface CloneInterfaceInstance = (CloneInterface)cloneClassType.newInstance();
        // Instanciete CloneRecords_Service. CloneRecord_Service class contain constructor which instanciete CloneAccount/CloneOppty
        CloneRecords_Service cloneRecord = new CloneRecords_Service(CloneInterfaceInstance);
       // CloneInterfaceInstance.CloneRecord(recordId);
       sObject returnedObject = cloneRecord.CloneRecord(recordId);
       return returnedObject;

    }


    @AuraEnabled
    public static void cloneRelatedRecords(Id recordId, String className) {

        Type cloneClassType = type.forName(className);
        // Crete new instance of CloneInterface depending on cloneClassType variable
        CloneInterface CloneInterfaceInstance = (CloneInterface)cloneClassType.newInstance();
        // Instanciete CloneRecords_Service. CloneRecord_Service class contain constructor which instanciete CloneAccount/CloneOppty
        CloneRecords_Service cloneRecord = new CloneRecords_Service(CloneInterfaceInstance);
        cloneRecord.cloneRelatedRecords(recordId);

    }

}
