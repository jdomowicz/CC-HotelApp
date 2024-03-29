public class HotelDataUpdateQuable {

    @future
    public static void HotelDataCountUpdate(list<Id> recordIds) {

    map<Id,Integer> HotelServiceCT = new map<id,Integer>();
    map<Id,Integer> HotelAvialableCT = new map<id,Integer>();
    map<Id,Integer> HotelRentedleCT = new map<id,Integer>();
    list<Hotel__c> HotelUpdateList = new list<Hotel__c>();

    //Prepare DATA

    AggregateResult[] aggService = [SELECT Hotel__c , count(Id) ct from Room__c WHERE Hotel__c IN: recordIds  AND Service__c = TRUE GROUP BY Hotel__c];

    AggregateResult[] aggAvailable = [SELECT Hotel__c , count(Id) ct from Room__c WHERE Hotel__c IN: recordIds  AND service__c != TRUE AND occupied__c != TRUE  GROUP BY Hotel__c];
    AggregateResult[] aggOccupied = [SELECT Hotel__c , count(Id) ct from Room__c WHERE Hotel__c IN: recordIds  AND occupied__c = TRUE  GROUP BY Hotel__c];


    for(AggregateResult ar : aggService){
        HotelServiceCT.put((Id)ar.get('Hotel__c'),(Integer)ar.get('ct'));
    }
    for(AggregateResult arAvailable : aggAvailable){
        HotelAvialableCT.put((Id)arAvailable.get('Hotel__c'),(Integer)arAvailable.get('ct'));
    }
     for(AggregateResult arOccupied : aggOccupied){
        HotelRentedleCT.put((Id)arOccupied.get('Hotel__c'),(Integer)arOccupied.get('ct'));
    }

    for(Hotel__c h: [SELECT Id,Rooms_out_of_service__c FROM Hotel__c WHERE Id In: recordIds]){

        if(aggService.size() == 0){
        h.Rooms_out_of_service__c = 0;
        }
        else{
            h.Rooms_out_of_service__c = HotelServiceCT.get(h.Id);
        }
        h.Rooms_Available__c = HotelAvialableCT.get(h.Id);
        h.Total_Rented_Rooms__c = HotelRentedleCT.get(h.Id);

        HotelUpdateList.add(h);

    }
    update HotelUpdateList;

    }


    public static void updateHotelMetrics(list<Id> recordIds){


        

    }
}