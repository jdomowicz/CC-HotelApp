public class MapMarker {

	//MapLocationData location;

	public MapMarker(){

		this.location = new MapLocationData();
	}

    @AuraEnabled
	 this.location;
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
