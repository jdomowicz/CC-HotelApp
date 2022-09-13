public with sharing class CloneRecordService {


   private CloneRecordInterface cloneLogic

    public CloneRecordService(CloneRecordInterface cloneClass) {
        CloneRecordInterface cloneLogic = cloneClass;
        system.debug(cloneLogic);
    }

}
