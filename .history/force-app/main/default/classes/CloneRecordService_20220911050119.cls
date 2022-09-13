public with sharing class CloneRecordService {


    CloneRecordInterface cloneLogic

    public CloneRecordService(CloneRecordInterface cloneClass) {
        CloneRecordInterface cloneLogic = cloneClass;
        system.debug(cloneLogic);
    }

}
