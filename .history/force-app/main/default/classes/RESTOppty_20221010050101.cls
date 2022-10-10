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

     public void postOppty(String nm,Decimal Amt) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:CredentialsOrgB/services/apexrest/Oppty/');
        request.setMethod('POST');
        request.setHeader('Content-Type','application/json');

        String opptyToPass = JSON.serialize(wrapOppty(generateOppty(nm,Amt)));
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


   private Opportunity generateOppty(String nm,Decimal Amt){

        Opportunity Oppty = new Opportunity();
        Oppty.Name = nm;
        Oppty.StageName = 'Prospecting';
        Oppty.CloseDate = Date.newInstance(2022, 10, 16);
        Oppty.Amount =Amt;
        return Oppty;
	}

	private OpptyWrapper wrapOppty(Opportunity Oppty){
		OpptyWrapper wrapper = new OpptyWrapper();
		wrapper.Oppty = Oppty;
		return wrapper;
	}

}