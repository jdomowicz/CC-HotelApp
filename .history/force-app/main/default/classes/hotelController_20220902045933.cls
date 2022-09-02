public class hotelController {


    public static void roomNumber() {
    list<Hotel__c> hotels = [Select Id,Name,Rooms_Available__c FROM Hotel__c];
    Map<Id, Hotel__c> hotelMap = new Map<Id, Hotel__c>(hotels);
    }

    @AuraEnabled (cacheable = true)
    public static list<AggregateResult> countryList(){
        return  [SELECT Country__c FROM Hotel__c WHERE Country__c <> NULL GROUP BY Country__c];
    }

       @AuraEnabled (cacheable = true)
    public static list<AggregateResult> cityList(String countryName){

        String Country = countryName;

        if(String.isEmpty(Country)){

            return  [SELECT City__c FROM Hotel__c WHERE City__c <> NULL GROUP BY City__c];

        } else {

            return  [SELECT City__c FROM Hotel__c WHERE City__c <> NULL AND Country__c =: Country GROUP BY City__c];
        }


    }

    @AuraEnabled (cacheable = true)
    public static list<AggregateResult> hotelList(String countryName,String cityName){

        String CountryFilter = countryName;
        String CityFilter = cityName;

        list<String> formulaKeys = new list<String>{};
        String formula = '';

       if(!String.isEmpty(CountryFilter)){
        formulaKeys.add('Country__c =: CountryFilter');
       }

      if(!String.isEmpty(CityFilter)){
        formulaKeys.add('City__c =: CityFilter');
       }

      if(formulaKeys.size()>0){
        formula = ' WHERE ' + String.join(formulaKeys, ' AND ');
      }

        String query = 'SELECT Id,Name FROM Hotel__c' + formula + ' LIMIT 10';

        return Database.query(query);

}
    @AuraEnabled (cacheable = true)
    public static list<Hotel__c> hotelListDropdown(){

        return [SELECT Id,Name,TTM_ACV__c,total_rooms__c,Total_Rented_Rooms__c,Rooms_out_of_service__c,Rooms_Available__c,Rating__c,City__c,Country__c from Hotel__c];

}

  @AuraEnabled (cacheable = true)
    public static Hotel__c returnHotelData(String Hid){

        return [SELECT Id,Name,TTM_ACV__c,total_rooms__c,Rating_Stars__c,Total_Rented_Rooms__c,Rooms_out_of_service__c,Rooms_Available__c,Rating__c,City__c,Country__c from Hotel__c WHERE Id =: Hid];

    }
}