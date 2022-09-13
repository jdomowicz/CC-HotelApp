public with sharing class CloneRecordService {

    // Instance od CloneRecordInterface;
   private CloneRecordInterface cloneLogic;

   // Use constructor to instanciete CloneRecordInterface type class with default 
    public CloneRecordService(CloneRecordInterface cloneClass) {
        cloneLogic = cloneClass;
        system.debug(cloneLogic);
    }


    public void cloneRecords(Id recordId){

        cloneLogic.cloneRecords(recordId);

    }

}
