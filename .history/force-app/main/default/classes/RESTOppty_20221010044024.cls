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

     public void postOppty() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:CredentialsOrgB/services/apexrest/Oppty');
        request.setMethod('POST');

        String opptyToPass = JSON.serialize(wrapOppty());
        //

        request.setBody(opptyToPass);
        system.debug(request.getBody());

            HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
            system.debug('Response status: ' + response.getStatusCode());

            if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.

        system.debug(response.getBody());
            }

  }


   private Opportunity generateOppty(){
		
        Opportunity Oppty = new Opportunity();
        Oppty.Name = 'test';
        Oppty.StageName = 'Prospecting';
        Oppty.CloseDate = Date.newInstance(2022, 10, 16);
        return Oppty;
	}

	private OpptyWrapper wrapAccount(Opportunity Oppty){
		OpptyWrapper wrapper = new OpptyWrapper();
		wrapper.Oppty = Oppty;
		return wrapper;
	}

}