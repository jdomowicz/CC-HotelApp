public with sharing class CloneRecordController {

    public static void cloneRecords(Id recordId, String className) {

        Type classType = Type.forName(className);

        // CloneRecordInterface cloneInterfaceInstance = new CloneAcccounts();
        CloneRecordInterface cloneInterfaceInstance = (CloneRecordInterface)classType.newInstance();

        CloneRecordService cloneRecords = new CloneRecordService(cloneInterfaceInstance);

    }
}
