
@RestResource(urlMapping='/Oppty/*')
global with sharing class webServiceOppty {

    @HttpPost
    global static id createRecord(Name String,amt Double) {

       Opportunity opp = new Opportunity(
        Name = Name,
        Amount = Amount
       );

        insert opp;
        return opp.Id;

    }
}
