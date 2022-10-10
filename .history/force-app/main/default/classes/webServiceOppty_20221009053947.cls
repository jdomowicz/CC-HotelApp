
@RestResource(urlMapping='/Oppty/*')
global with sharing class webServiceOppty {

    @HttpPost
    global static id createRecord(Name String,Amount Double) {

       OpportunityLineItem

        insert opp;
        return opp.Id;

    }
}
