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

            if(op.Type == classType){

                tempList.add(op);
            }
        }

        //execute only if list > 0
        if(opptyList.size()>0){

        //Trigger TriggerOpptys Update for each class Type
        triggerOpptys(opptyList,classType);

        }

    }

}

}
