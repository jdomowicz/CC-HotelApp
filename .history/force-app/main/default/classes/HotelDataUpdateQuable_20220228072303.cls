public class HotelDataUpdateQuable {

   // @future
    public static void HotelDataUpdateUnderService(map<String,Id> recordIds) {

    set<Id> HotelList = new set<Id>();

    map<Id,Integer> HotelServiceCT = new map<id,Integer>();
    list<Hotel__c> HotelUpdateList = new list<Hotel__c>();

    HotelList.add(recordIds.get('Service'));

    AggregateResult[] aggService = [SELECT Hotel__c , count(Id) ct from Room__c WHERE Hotel__c IN: HotelList  AND Service__c = TRUE GROUP BY Hotel__c];

    AggregateResult[] aggAvailable = [SELECT Hotel__c , count(Id) ct from Room__c WHERE Hotel__c IN: HotelList  AND service__c != TRUE AND occupied__c != TRUE  GROUP BY Hotel__c];

    AggregateResult[] aggOccupied = [SELECT Hotel__c , count(Id) ct from Room__c WHERE Hotel__c IN: HotelList  AND occupied__c = TRUE  GROUP BY Hotel__c];

    for(AggregateResult ar : aggService){
        HotelServiceCT.put((Id)ar.get('Hotel__c'),(Integer)ar.get('ct'));
    }

    for(AggregateResult ar : aggOc){
        HotelServiceCT.put((Id)ar.get('Hotel__c'),(Integer)ar.get('ct'));
    }


    for(Hotel__c h: [SELECT Id,Rooms_out_of_service__c FROM Hotel__c WHERE Id In: HotelServiceCT.keySet()]){
        h.Rooms_out_of_service__c = HotelServiceCT.get(h.Id);
        HotelUpdateList.add(h);

    }
    update HotelUpdateList;


    }

  //  @future
    public static void HotelDataUpdateRentedRooms(map<String,Id> recordIds) {
    }
  //   @future
    public static void HotelDataUpdateUnRentedUpdate(map<String,Id> recordIds) {
    }
}
