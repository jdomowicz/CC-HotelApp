
@RestResource(urlMapping='/Oppty/*')
global with sharing class webServiceOppty {

    @HttpPost
    global static id createRecord(nm String,amt Double) {

       Opportunity opp = new Opportunity(
        Name = Name,
        Amount = amt
       );

        insert opp;
        return opp.Id;

    }
}
