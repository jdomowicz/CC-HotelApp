public with sharing class JSONtoRecipeByIng {



public class JSONtoRecipebyIgr {

	public Integer id;
	public String title;
	public String image;
	public String imageType;
	public Integer usedIngredientCount;
	public Integer missedIngredientCount;
	public Integer likes;

	
	public static List<JSONtoRecipebyIgr> parse(String json) {
		return (List<JSONtoRecipebyIgr>) System.JSON.deserialize(json, List<JSONtoRecipebyIgr>.class);
	}
}

}
