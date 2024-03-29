//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class JSONtoRecipeBasic {

	@AuraEnabled(cacheable=true)
	
	public class Recipes {
		public String title;
		public String image;
		public String summary;
		public String instructions;
	}

	public List<Recipes> recipes;


	public static JSONtoRecipeBasic parse(String json) {
		return (JSONtoRecipeBasic) System.JSON.deserialize(json, JSONtoRecipeBasic.class);
	}
}