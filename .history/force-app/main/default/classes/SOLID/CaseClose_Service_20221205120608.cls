public with sharing class CaseClose_Service {


private static map<String,Type> pickOpptyTypetoClose = new map<String,Type>{
    'Service'=> CaseClose_ServiceOppty.class,
    'Sales'=> CaseClose_SalesOppty.class
};

private static void triggerOpptys(list<Opportunity> OpptyList, String recordType){

    ICaseClose caseCloseInstance =  (ICaseClose)pickOpptyTypetoClose.get(recordType).newInstance();
    caseCloseInstance.determineIfClose(OpptyList);

}


public static void closeOppty(List<Opportunity> opptyList){

    for(String classType : pickOpptyTypetoClose.keySet()){

        list<Opportunity> tempList = new List<Opportunity>();

        for(Opportunity op : opptyList){

            if(op.Type == pickOpptyTypetoClose.keySet()){

                tempList.add(op);
            }

        }

        if()

        //Trigger TriggerOpptys Update for each class Type
        triggerOpptys(opptyList,pickOpptyTypetoClose.keySet());

    }

}

}
