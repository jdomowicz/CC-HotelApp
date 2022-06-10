public class HotelDataUpdateQuable {

   // @future
    public static void HotelDataUpdateUnderService(map<String,Id> recordIds) {

    set<Id> HotelToUpdate = new set<Id>();
    map<Id,Integer> HotelServiceCT = new map<id,Integer>();
    list<Id>

    HotelToUpdate.add(recordIds.get('Service'));

    AggregateResult[] agg = [SELECT Hotel__c , count(Id) ct from Room__c WHERE Hotel__c = 'a007Q000004E0lQQAS' AND Service__c = TRUE GROUP BY Hotel__c];

    for(AggregateResult ar : agg){
        HotelServiceCT.put((Id)ar.get('Hotel__c'),(Integer)ar.get('ct'));
    }

    for(Hotel__c h: [SELECT Id,Rooms_out_of_service__c FROM Hotel__c WHERE Id In: HotelServiceCT.keySet()]){
        h.Rooms_out_of_service__c = HotelServiceCT.get(h.Id);
    }

    }

  //  @future
    public static void HotelDataUpdateRentedRooms(map<String,Id> recordIds) {
    }
  //   @future
    public static void HotelDataUpdateUnRentedUpdate(map<String,Id> recordIds) {
    }
}
