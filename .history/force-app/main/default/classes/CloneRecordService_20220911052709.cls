public with sharing class CloneRecordService {

    // Instance od CloneRecordInterface;
   private CloneRecordInterface cloneLogic;

   // Use constructor to instanciete CloneRecordInterface type class with cloneClass implementation (Clone Opportunities or Clone Accounts)

    public CloneRecordService(CloneRecordInterface cloneClass) {
        cloneLogic = cloneClass;
        system.debug(cloneLogic);
    }


    
    public void cloneRecords(Id recordId){

        cloneLogic.cloneRecords(recordId);

    }

}
