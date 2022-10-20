// DataCreator.cls
public class DataCreator {

    private static final Map<sObjectType, System.Type> OBJECT_TO_FACTORY = new Map<sObjectType, System.Type>{
        Account.sObjectType => AccountFactory.class,
        Contact.sObjectType => ContactFactory.class
    };

    public static void createRecord(sObjectType objectTypeToCreate) {

      DataFactory  factory = (DataFactory) OBJECT_TO_FACTORY.get(objectTypeToCreate).newInstance();
      
      return factory.createRecord();
    }
}