public with sharing class cloneAccount implements CloneInterface {

    /*
        This class implement interface and must include the same methods as Interface class!!!
        It contains logic to clone Account used by CloneRecord_Service.
        Because cloneAccount implement CloneInterface it can the same type as CloneInterface and used by CloneRecord_Service
    */

    public Account cloneRecord(Id recordId){
        system.debug('This is clone Account logic running');
        return 
    }

    public void cloneRelatedRecords(Id recordId){
        system.debug('This is clone related Account records logic running');

    }


}
