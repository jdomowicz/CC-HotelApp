
@RestResource(urlMapping='/Oppty/*')
global with sharing class webServiceOppty {

    @HttpPost
    public static id putRecord(Id opptyId) {

        Opportunity opp = [Select Name,Amount from Opportunity where Id := opptyId];

        insert opp;
        return opp.Id

    }
}
