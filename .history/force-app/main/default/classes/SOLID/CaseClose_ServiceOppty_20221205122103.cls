public with sharing class CaseClose_ServiceOppty implements ICaseClose {


    public static void determineIfClose(List<Opportunity> OpptyList){

        system.debug();

        List<Opportunity> oppList = new list<Opportunity>();

        for(Opportunity opp : OpptyList){

            opp.StageName = 'Closed - Service';
            oppList.add(opp);
        }

        upsert oppList;

    }
}
