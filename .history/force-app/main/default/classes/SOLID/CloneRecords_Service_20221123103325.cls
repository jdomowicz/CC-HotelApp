public with sharing class CloneRecords_Service {


    /*
        This service class can 
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
    public void CloneRecord(Id recordId){
        this.cloneLogic.CloneRecord(recordId);
    }


    // runing the CloneRecord method from CloneInterface class
    public void cloneRelatedRecords(Id recordId){
        this.cloneLogic.cloneRelatedRecords(recordId);

    }
}
