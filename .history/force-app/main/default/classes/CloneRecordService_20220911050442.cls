public with sharing class CloneRecordService {

   private CloneRecordInterface cloneLogic;

    public CloneRecordService(CloneRecordInterface cloneClass) {
        cloneLogic = cloneClass;
        system.debug(cloneLogic);
    }


    public void cloneRecords(Id recordId){

        cloneLogic.cloneRecords(recordId);

    }

}
