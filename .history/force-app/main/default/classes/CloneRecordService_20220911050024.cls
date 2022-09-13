public with sharing class CloneRecordService {

    

    public CloneRecordService(CloneRecordInterface cloneClass) {
        private CloneRecordInterface cloneLogic;
        cloneLogic = cloneClass;
        system.debug(cloneLogic);
    }

}
