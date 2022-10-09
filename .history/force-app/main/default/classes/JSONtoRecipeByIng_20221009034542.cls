public with sharing class JSONtoRecipeByIng {


    @AuraEnabled public Integer id;
	@AuraEnabled public String title;
	public String image;
	public String imageType;
	public Integer usedIngredientCount;
	public Integer missedIngredientCount;
	public Integer likes;


	public static List<JSONtoRecipeByIng> parse(String json) {
		return (List<JSONtoRecipeByIng>) System.JSON.deserialize(json, List<JSONtoRecipeByIng>.class);
	}
}

