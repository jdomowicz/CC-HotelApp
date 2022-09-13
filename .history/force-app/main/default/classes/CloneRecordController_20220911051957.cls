public with sharing class CloneRecordController {


    public cloneRecords(Id recordId, String className) {

        Type classType = Type.forName(className);
        CloneRecordInterface cloneInterfaceInstance = (CloneRecordInterface)classType.newInstance();

        CloneRecordService()

    }
}
