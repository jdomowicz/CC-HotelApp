public with sharing class CaseClose_SalesOppty implements ICaseClose {


    public static void determineIfClose(List<Opportunity> OpptyList){

        system.debug('Service class called!');

        List<Opportunity> oppList = new list<Opportunity>();

        for(Opportunity opp : OpptyList){

            opp.StageName = 'Closed - Won';
            oppList.add(opp);
        }

        upsert oppList;

    }
}
