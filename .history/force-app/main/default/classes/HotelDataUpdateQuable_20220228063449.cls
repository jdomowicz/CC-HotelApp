public class HotelDataUpdateQuable {

   // @future
    public static void HotelDataUpdateUnderService(map<String,Id> recordIds) {

    set<Id> HotelToUpdate = new set<Id>();

    HotelToUpdate.add(recordIds.get('Service'));

    for(Hotel__c h : HotelToUpdate){


        AggregateResult[] agg = [SELECT Hotel__c , count(Id) ct from Room__c WHERE Hotel__c = 'a007Q000004E0lQQAS' AND Service__c = TRUE GROUP BY Hotel__c ];
    }

    }

  //  @future
    public static void HotelDataUpdateRentedRooms(map<String,Id> recordIds) {
    }
  //   @future
    public static void HotelDataUpdateUnRentedUpdate(map<String,Id> recordIds) {
    }
}
