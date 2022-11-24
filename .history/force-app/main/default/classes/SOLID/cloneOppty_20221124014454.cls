public with sharing class cloneOppty implements CloneInterface {

    /*
        This class implement interface and must include the same methods as Interface class!!!
    */

    @AuraEnabled
    public static string methodName(){
        try {
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    public void cloneRecord(Id recordId){
        system.debug('This is clone Oppty logic running');

    }

    public void cloneRelatedRecords(Id recordId){
        system.debug('This is clone related Oppty records logic running');

    }


}
