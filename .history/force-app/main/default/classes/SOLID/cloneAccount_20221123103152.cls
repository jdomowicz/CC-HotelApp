public with sharing class cloneAccount implements CloneInterface {

    /*
        This class implement interface and must include the same methods as Interface class!!!
        It contains logic to clone Account used by Clone
    */

    public void cloneRecord(Id recordId){
        system.debug('This is clone Account logic running');

    }

    public void cloneRelatedRecords(Id recordId){
        system.debug('This is clone related Account records logic running');

    }


}
