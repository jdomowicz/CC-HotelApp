public with sharing class JSONtoRecipeByIng {



public class JSONtoRecipeByIng {

	public Integer id;
	public String title;
	public String image;
	public String imageType;
	public Integer usedIngredientCount;
	public Integer missedIngredientCount;
	public Integer likes;

	
	public static List<JSONtoRecipeByIng> parse(String json) {
		return (List<JSONtoRecipebyIgr>) System.JSON.deserialize(json, List<JSONtoRecipebyIgr>.class);
	}
}

}
