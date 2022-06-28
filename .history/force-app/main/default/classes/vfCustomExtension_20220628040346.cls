public with sharing class vfCustomExtension {

    string message = 'This is custom message from extension';

    public vfCustomExtension(ApexPages.vfCodeWithControllerExtension) {}
    
    {
        return message;
    }
}
