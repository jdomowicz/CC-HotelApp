public class MapMarker {

    @AuraEnabled
	public MapLocation location;
	@AuraEnabled
	public String title;
	@AuraEnabled
	public String description;



	@AuraEnabled
	public class MapLocation {
	@AuraEnabled
	public String Street;
	@AuraEnabled
	public String City;
	@AuraEnabled
	public String Country;
	@AuraEnabled
	public String PostalCode;

	}

}
