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

        system.debug(+ cloneLogic);
        this.cloneLogic = cloneClass;
        system.debug(cloneLogic);
    }

    // runing the CloneRecord method from CloneInterface class
    public CloneInterface CloneRecord(Id recordId){
        this.cloneLogic.CloneRecord(recordId);
        return this.cloneLogic;
    }


    // runing the CloneRecord method from CloneInterface class
    public void cloneRelatedRecords(Id recordId){
        this.cloneLogic.cloneRelatedRecords(recordId);

    }
}
