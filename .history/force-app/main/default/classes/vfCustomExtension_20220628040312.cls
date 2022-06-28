public with sharing class vfCustomExtension {

    string message = 'This is custom message from extension';

    public String gettextMessage(ApexPages.vfCodeWith) {
        return message;
    }
}
