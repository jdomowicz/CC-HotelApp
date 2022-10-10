
@RestResource(urlMapping='/Oppty/*')
global with sharing class webServiceOppty {

    @HttpPost
    global static id createRecord(String nm,Double) {

       Opportunity opp = new Opportunity(
        Name = nm,
        Amount = amt
       );

        insert opp;
        return opp.Id;

    }
}
