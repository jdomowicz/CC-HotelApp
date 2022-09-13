public with sharing class CloneRecordService {



    public CloneRecordService(CloneRecordInterface cloneClass) {
        CloneRecordInterface cloneLogic = cloneClass;
        system.debug(cloneLogic);
    }

}
