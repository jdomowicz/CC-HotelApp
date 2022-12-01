public class MapMarker {


	public MapMarker(){

		this.location = new MapLocationData();
	}

    @AuraEnabled
	public MapLocationData location;
	@AuraEnabled
	public String title;
	@AuraEnabled
	public String description;



	public class location {
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
