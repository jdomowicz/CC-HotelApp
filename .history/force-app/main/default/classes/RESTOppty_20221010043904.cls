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
		Account acct = new Account();
		acct.Name = 'Hi';
		acct.Phone = '8162221111';
		return acct;
	}

	private AccountWrapper wrapAccount(Account acct){
		AccountWrapper wrapper = new AccountWrapper();
		wrapper.acct = acct;
		return wrapper;
	}

}