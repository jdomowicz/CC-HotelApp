public interface CloneInterface {
     /*
    Interface is contract!! When you implement interface you must create the same method like the ones in Interface!! Methods in interface comeswith no body!!!!

    Using Interface you can create different implementation of interface depending on object or process. For example you can create Clone Interface that is cloning different objects:
    - account
    - oppty
    - task

    Is used with CloneRecords LWC component to clone records
    */

    void CloneRecord(Id recordId);
    void cloneRelated(Id recordId);


}
