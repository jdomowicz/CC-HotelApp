public with sharing class JSONtoRecipeByIng {


    @AuraEnabled public Integer id;
	@AuraEnabled public String title;
	@AuraEnabled public String image;
	@AuraEnabled public String imageType;
	@AuraEnabled public Integer usedIngredientCount;
	@AuraEnabled public Integer missedIngredientCount;
	@AuraEnabled public Integer likes;


	public static List<JSONtoRecipeByIng> parse(String json) {
		return (List<JSONtoRecipeByIng>) System.JSON.deserialize(json, List<JSONtoRecipeByIng>.class);
	}
}

