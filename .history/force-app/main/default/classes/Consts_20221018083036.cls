// Consts.cls
public with sharing class Consts {
    public static final ContactConsts CONTACT {
        get {
            return ContactConsts.INSTANCE;
        }
    }
}