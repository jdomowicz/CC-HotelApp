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


     public static void postOppty(String nm) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:CredentialsOrgB/services/apexrest/Oppty/'+ id);

            request.setMethod('POST');
            request.setBody('nm=nm&amt=amt');
            HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
            system.debug('Response status: ' + response.getStatusCode());

            if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.

        system.debug(response.getBody());
            }

    }

}
