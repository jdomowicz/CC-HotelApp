public class MapMarker {

	MapLocationData location;

	public MapMarker(){

		location = new MapLocationData();
	}

    @AuraEnabled
	public MapLocationData this.location;
	@AuraEnabled
	public String title;
	@AuraEnabled
	public String description;



	public class MapLocationData {
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
