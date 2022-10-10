
@RestResource(urlMapping='/Oppty/*')
global with sharing class webServiceOppty {

    @HttpPost
    global static id createRecord(Name String,Amount ) {

        Opportunity opp = [Select Name,Amount from Opportunity where Id =: opptyId];

        insert opp;
        return opp.Id;

    }
}
