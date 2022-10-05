public class JSON2APEX {

	public class User {
		public String name;
		public String twitter;
	}

	public User user;
    public String Message = 'JSON2APEX'


	public static JSON2APEX parse(String json) {
		return (JSON2APEX) System.JSON.deserialize(json, JSON2APEX.class);
	}
}