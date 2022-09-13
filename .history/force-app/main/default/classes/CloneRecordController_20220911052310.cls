public with sharing class CloneRecordController {

    public static void cloneRecords(Id recordId, String className) {

        Type classType = Type.forName(className);

        // CloneRecordInterface cloneInterfaceInstance = new CloneAcccounts();
        CloneRecordInterface cloneInterfaceInstance = (CloneRecordInterface)classType.newInstance();


        // Trigger CloneRecordService class with default type 
        CloneRecordService cloneRecords = new CloneRecordService(cloneInterfaceInstance);

    }
}
