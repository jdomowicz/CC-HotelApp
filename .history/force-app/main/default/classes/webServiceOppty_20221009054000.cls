
@RestResource(urlMapping='/Oppty/*')
global with sharing class webServiceOppty {

    @HttpPost
    global static id createRecord(Name String,Amount Double) {

       Opportunity opp = new Opportunity

        insert opp;
        return opp.Id;

    }
}
