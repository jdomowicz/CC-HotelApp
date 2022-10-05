public with sharing class Spoonacular {

    public static final String SPOONACULAR_API = 'https://api.spoonacular.com';

    public static void getRandomReceipe() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.spoonacular.com/recipes/random?apiKey=3e17cd79a413430a82b9ffbfe19acfae');

    //String apiKey = '?apiKey=3e17cd79a413430a82b9ffbfe19acfae';

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
