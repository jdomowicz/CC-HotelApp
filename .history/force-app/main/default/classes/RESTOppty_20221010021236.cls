public with sharing class RESTOppty {


        public static void getOppty() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:CredentialsOrgB/services/apexrest/Opptys');

            request.setMethod('GET');
            HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
            system.debug('Response status: ' + response.getStatusCode());

            if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.

        system.debug(response.getBody());
            }

    }
}
