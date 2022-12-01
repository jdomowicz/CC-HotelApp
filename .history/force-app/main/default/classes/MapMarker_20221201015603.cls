public class MapMarker {

	//public mapLocationMarkers location;

	public mapMarker(){

		//this.location = new mapLocationMarkers();title 

	}


    @AuraEnabled
	public mapLocationMarkers location;
	@AuraEnabled
	public String title;
	@AuraEnabled
	public String description;



	public class mapLocationMarkers{
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
