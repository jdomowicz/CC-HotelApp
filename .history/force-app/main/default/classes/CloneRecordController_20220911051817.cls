public with sharing class CloneRecordController {


    public cloneRecords(Id recordId, String className) {

        Type classType = Type.forName(className);
        CloneRecordInterface intr = (CloneRecordInterface)Type.forName('CloneAccouts').newInstance();  

    }
}