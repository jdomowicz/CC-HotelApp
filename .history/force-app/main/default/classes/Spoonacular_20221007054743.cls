
public class Spoonacular {

    public static final String SPOONACULAR_API = 'https://api.spoonacular.com';
    public static final String API_KEY = '3e17cd79a413430a82b9ffbfe19acfae';

    @AuraEnabled
    public static list<JSONtoRecipeBasic.Recipes> getRandomReceipe() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + '/recipes/random?apiKey=' + API_KEY);


    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    system.debug('Response status: ' + response.getStatusCode());

    if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.

        JSONtoRecipeBasic responseRecipe = JSONtoRecipeBasic.parse(response.getBody());
        list<JSONtoRecipeBasic.Recipes> recipe = responseRecipe.recipes;

        return recipe;
    }
    else {

        list<JSONtoRecipeBasic.Recipes> recipe = new list<JSONtoRecipeBasic.Recipes>();
        return recipe;
    }

    }

    public static list<JSONtoRecipeById> getReceipe(String receipeId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + '/recipes/'+ receipeId + '/information?apiKey=' + API_KEY);

    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    system.debug('Response status: ' + response.getStatusCode());

    if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
        system.debug('Response data: ' + response.getBody());

        JSONtoRecipeById responseRecipe = JSONtoRecipeById.parse(response.getBody());
        list<JSONtoRecipeById> recipe = responseRecipe.recipes;

        return recipe;
    }
    else {

        list<JSONtoRecipeById> recipe = new list<JSONtoRecipeBasic>();
        return recipe;
    }

    }

    public static String getReceipeString(String receipeId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + '/recipes/'+ receipeId + '/information?apiKey=' + API_KEY);

    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    system.debug('Response status: ' + response.getStatusCode());

    if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.

        string s = response.getBody();
        return s;
    }
    else {

        return 'No Recipe fetched from server';
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