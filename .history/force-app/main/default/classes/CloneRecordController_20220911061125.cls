public with sharing class CloneRecordController {


    @AuraEnabled
    public static void cloneRecords(Id recordId, String className) {

        Type classType = Type.forName(className);

        // CloneRecordInterface cloneInterfaceInstance = new CloneAcccounts();
        CloneRecordInterface cloneInterfaceInstance = (CloneRecordInterface)classType.newInstance();

        // Trigger CloneRecordService Constructor Method to construct class of type CloneRecordInterface and implementation given in cloneInterfaceInstance variable
        // CloneRecordService cloneRecords = new CloneAcccounts();

        CloneRecordService cloneRecords = new CloneRecordService(cloneInterfaceInstance);

        // Trigger method that clones the record;
        cloneRecords.cloneRecords(recordId);

    }
}
