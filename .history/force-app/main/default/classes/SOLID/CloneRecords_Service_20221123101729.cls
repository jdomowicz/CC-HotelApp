public with sharing class CloneRecords_Service {


    //Instanciete interface class
    private CloneInterface cloneLogic;

    // creating class constructor
    // passing cloneInterface as argument
    // assiging passed argument to private variable called cloneLogic. Its type is CloneInterface.
    public CloneRecords_Service(CloneInterface cloneClass) {
        this.cloneLogic = cloneClass;

    }

    public void CloneRecords(){
        this.cloneLogic.CloneRecord()
    }
}
