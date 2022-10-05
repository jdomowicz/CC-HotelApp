public class JSON2Apex {

	public class User {
		public String name;
		public String twitter;
	}

	public User user;

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}
}