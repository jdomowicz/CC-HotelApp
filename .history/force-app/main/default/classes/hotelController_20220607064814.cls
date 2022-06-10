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
            //return  [SELECT City__c FROM Hotel__c WHERE City__c <> NULL GROUP BY City__c];
        }


    }

    @AuraEnabled (cacheable = true)
    public static list<AggregateResult> hotelList(String countryName,String cityName){

        String CountryFilter = countryName;
        String CityFilter = ;

        list<String> formula;

       if(!String.isEmpty(countryName)){

        formula.add('Country__c =: countryName');


       if(String.isEmpty(City)){
           City = null;
       }else{
           City = '%' + City + '%';
       }

       formula = Country + ' ' + City;


        return  [SELECT Id,Name FROM Hotel__c WHERE  Country__c =: countryName AND City__c =: cityName GROUP BY Id,Name ];
    }

}
