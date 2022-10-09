public with sharing class Spoonacular {

    public static final String SPOONACULAR_API = 'https://api.spoonacular.com';
    public static final String API_KEY = '3e17cd79a413430a82b9ffbfe19acfae';

    @AuraEnabled(cacheable=true)
    public static JSONtoRecipeBasic getRandomReceipe() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + '/recipes/random?apiKey=' + API_KEY);


    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    system.debug('Response status: ' + response.getStatusCode());

    if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
        return (JSONtoRecipeBasic) JSONtoRecipeBasic.parse(response.getBody());
    }
    else return 

    }

    public static void getReceipe(String receipeId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + '/recipes/'+ receipeId + '/information?apiKey=' + API_KEY);

    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    system.debug('Response status: ' + response.getStatusCode());

    if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    system.debug('Response body: ' + response.getBody());
    }

    }

        public static void getReceipeByIngredients(String ingredients) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint(SPOONACULAR_API + '/recipes/findByIngredients?apiKey=' + API_KEY + '&ingredients=' + ingredients);

    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    system.debug('Response status: ' + response.getStatusCode());

    if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    system.debug('Response body: ' + response.getBody());
    }

    }

}