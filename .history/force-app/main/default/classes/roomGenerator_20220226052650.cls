public class roomGenerator {

    public static void generateRooms(list<Hotel__c> hotelList){

        //Prepare data
        list<Hotel__c> queryList = [Select Id,Name from Hotel__c where Id IN: hotelList];
        //Create list to upload
        list<Room__c> uploadList = new list <Room__c>();
        //Available rooms
        list<String> typeList = new list<String>{'single','double','king','President Suite'};


    for(Hotel__c h:queryList){
        for(Integer i=0;i<typeList.size();i++){

        Room__c ht = new Room__c(
        Hotel__c = h.Id,
        Name = TypeList[i] + ' Room ' + h.Name,
        Room_Number__c = 0,
        Type__c = TypeList[i],
        Mini_Bar__c = true,
        Available__c = true,
        Air_Condition__c = true,
        tv__c = true,
        jacuzzi__c = TypeList[i] == 'President Suite' ? true : false);
      uploadList.add(ht);
        }
    }
       insert uploadList;
    }


    public static void updateRoomsNumbers() {


        AggregateResult[] aggRooms = [SELECT Hotel__c, count(Id) ct FROM Room__c group by Hotel__c];

        map<String,Integer> hotelwithRoomCount = new map<String,Integer>();
        list<Room__c> updateListRoom = new list<Room__c>();
        list<Hotel__c> updateListHotels = new list<Hotel__c>();

        for(AggregateResult agg: aggRooms){
        hotelwithRoomCount.put(String.valueOf(agg.get('Hotel__c')), Integer.valueOf(agg.get('ct')));
        }

        list<Hotel__c> hotelsList = [Select ID,(Select Id from Rooms__r) from Hotel__c WHERE id IN: hotelwithRoomCount.keySet()];

        for(Hotel__c h : hotelsList){

            h.total_rooms__c = hotelwithRoomCount.get(h.Id);

            for(Room__c r :h.Rooms__r){

            Integer roomNum = 1;
            r.Room_Number__c = roomNum;
            updateListRoom.add(r);
            roomNum++;

            }
            updateListHotels.add(h);
        }

        update updateListHotels;
        update updateListRoom;

    }

}
