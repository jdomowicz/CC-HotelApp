public with sharing class RESTOppty {


        public static void getOppty(String id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:CredentialsOrgB/services/apexrest/Oppty/'+ id);

            request.setMethod('GET');
            HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
            system.debug('Response status: ' + response.getStatusCode());

            if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.

        system.debug(response.getBody());
            }

    }

     public static void postOppty(String nm,Double amt) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:CredentialsOrgB/services/apexrest/Oppty/');

        Opportunity opp = new Opportunity(
            Name=nm,
            Amount=amt
        );
        String opptyToPass=JSON.serialize(opp);

        system.debug(opptyToPass);

            request.setMethod('POST');
            request.setBody(opptyToPass);
            system.debug(request);
            HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
            system.debug('Response status: ' + response.getStatusCode());

            if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.

        system.debug(response.getBody());
            }

    }

    private Opportunity generateOppty(String nm,Double amt){

        Opportunity opp = new opportunity();
        opp.Name = nm;
        opp.Amount = amt;
        return opp;
    }

    private OpptyWrapper wrapOppty(Opportunity opp){

        OpptyWrapper wrapper = new OpptyWrapper();
        wrapper.opp = 
    }

}
