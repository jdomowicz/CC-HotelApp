
@RestResource(urlMapping='/Oppty/*')
global with sharing class webServiceOppty {

    @HttpPost
    public static Opportunity putRecord(Id opptyId) {

        Opportunity opp = [Select Name,Amount from Opportunity where id]


    }
}
