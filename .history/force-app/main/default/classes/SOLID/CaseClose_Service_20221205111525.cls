public with sharing class CaseClose_Service {


public map<String,Type> pickCaseTypetoClose = new map<String,Type>{

    'Service'=> CaseClose_ServiceOppty.class,
    'Sales'=> CaseClose_SalesOppty.class


}


}