
@RestResource(urlMapping='/Oppty/*')
global with sharing class webServiceOppty {

    @HttpPost
    global static id createRecord(Name String,Amount Double) {

       

        insert opp;
        return opp.Id;

    }
}
