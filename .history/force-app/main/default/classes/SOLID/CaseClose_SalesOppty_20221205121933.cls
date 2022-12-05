public with sharing class CaseClose_SalesOppty implements ICaseClose {


    public static void determineIfClose(List<Opportunity> OpptyList){

        List<Opportunity> oppList = new list<
        for(Opportunity opp : OpptyList){

            opp.StageName = 'Closed - Won';
        }

    }
}
