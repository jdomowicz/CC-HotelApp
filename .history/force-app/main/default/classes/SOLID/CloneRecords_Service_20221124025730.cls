public with sharing class CloneRecords_Service {

    /*
        This service class can accept different implementations of CloneInterface
            -cloneOppty
            -cloneAccount
            -cloneRoom
            -cloneHotel

            Its created only to execute Clone classes.
    */

    //Instanciete interface class
    private CloneInterface cloneLogic;

    // creating class constructor
    // passing cloneInterface as argument
    // assiging passed argument to private variable called cloneLogic. Its type is CloneInterface.
    public CloneRecords_Service(CloneInterface cloneClass) {
        this.cloneLogic = cloneClass;
    }

    // runing the CloneRecord method from CloneInterface class
    public sObject CloneRecord(Id recordId){
        this.cloneLogic.CloneRecord(recordId);
        return 
    }


    // runing the CloneRecord method from CloneInterface class
    public void cloneRelatedRecords(Id recordId){
        this.cloneLogic.cloneRelatedRecords(recordId);

    }
}
