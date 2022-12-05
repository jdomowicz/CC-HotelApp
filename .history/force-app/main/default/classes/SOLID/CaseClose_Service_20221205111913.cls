public with sharing class CaseClose_Service {


public static map<String,Type> pickOpptyTypetoClose = new map<String,Type>{
    'Service'=> CaseClose_ServiceOppty.class,
    'Sales'=> CaseClose_SalesOppty.class
};

public static void closeOppty(String recordType){

    ICaseClose caseCloseInstance =  (ICaseClose)pickCaseTypetoClose.get(recordType).newInstace();

};

}
