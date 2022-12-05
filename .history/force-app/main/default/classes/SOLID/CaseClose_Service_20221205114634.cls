public with sharing class CaseClose_Service {


private static map<String,Type> pickOpptyTypetoClose = new map<String,Type>{
    'Service'=> CaseClose_ServiceOppty.class,
    'Sales'=> CaseClose_SalesOppty.class
};

public static void closeOppty(list<Opportunity> OpptyList, String recordType){

    ICaseClose caseCloseInstance =  (ICaseClose)pickOpptyTypetoClose.get(recordType).newInstance();
    caseCloseInstance.determineIfClose(OpptyList);

};

private static map<String,list<Opportunity>> opptyMap(List<Opportunity> opptyList){

    for(Opportunity op : opp)

};

}
