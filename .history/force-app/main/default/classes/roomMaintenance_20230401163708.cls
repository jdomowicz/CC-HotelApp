public class roomMaintenance {

    public String imageUrl = Consts.ROOM_IMAGE.IMAGE_SOURCE.ImageUrl;

    public class roomType{
        String name;
        String url;}

    public static void generateRooms(list<Hotel__c> hotelList){

        //Prepare data
        list<Hotel__c> queryList = [Select Id,Name from Hotel__c where Id IN: hotelList];
        //Create list to upload
        list<Room__c> uploadList = new list <Room__c>();
        //Available rooms

       list<String> roomTypes = new list<String>{'Single','Double','King','President Suite'};

       list<roomType> roomList = new list<roomType>();

       for(Integer i=1;i<=roomTypes.size();i++){
        roomType r = new roomType();
        r.name = roomTypes[i-1];
        r.url = imageUrl + '/photo' + Integer.valueof((1+ Math.random() * 10)) + '.jpg';
        roomList.add(r);

       }


    for(Hotel__c h:queryList){
        for(Integer i=1;i<=roomList.size();i++){

        Room__c ht = new Room__c(
        Hotel__c = h.Id,
        Name = roomList[i-1].name + ' Room ' + h.Name,
        Type__c = roomList[i-1].name,
        Mini_Bar__c = true,
        Available__c = true,
        Air_Condition__c = true,
        tv__c = true,
        Room_Number__c=i,
        jacuzzi__c = roomList[i-1].name == 'President Suite' ? true : false,
        photo_url__c = roomList[i-1].url,
        Max_Number_of_Guests__c = roomList[i-1].name == 'President Suite' ? 5 : roomList[i-1].name == 'King' ? 4 : roomList[i-1].name == 'Double' ? 2 : 1
        );
      uploadList.add(ht);
        }
    }
       insert uploadList;
    }

    public static void updateHotelRoomsCount(List<Hotel__c> hotelList) {

        AggregateResult[] aggRooms = [SELECT Hotel__c, count(Id) ct FROM Room__c WHERE Hotel__c IN:hotelList group by Hotel__c];

        map<String,Integer> hotelwithRoomCount = new map<String,Integer>();
        list<Hotel__c> updateListHotels = new list<Hotel__c>();

        for(AggregateResult agg: aggRooms){
        hotelwithRoomCount.put(String.valueOf(agg.get('Hotel__c')), Integer.valueOf(agg.get('ct')));
        }
        list<Hotel__c> hotelsList = [Select ID,(Select Id from Rooms__r) from Hotel__c WHERE id IN: hotelwithRoomCount.keySet()];

        for(Hotel__c h : hotelsList){

            h.total_rooms__c = hotelwithRoomCount.get(h.Id);
            updateListHotels.add(h);
        }
        update updateListHotels;
    }

    public static void updateRoomNumbers(List<Hotel__c> hotelList) {
        AggregateResult[] aggRooms = [SELECT Hotel__c, count(Id) ct FROM Room__c WHERE Hotel__c IN:hotelList group by Hotel__c];

        map<String,Integer> hotelwithRoomCount = new map<String,Integer>();
        list<Room__c> updateListRoom = new list<Room__c>();

        for(AggregateResult agg: aggRooms){
        hotelwithRoomCount.put(String.valueOf(agg.get('Hotel__c')), Integer.valueOf(agg.get('ct')));
        }

        list<Hotel__c> hotelsList = [Select ID,(Select Id from Rooms__r) from Hotel__c WHERE id IN: hotelwithRoomCount.keySet()];

        for(Hotel__c h : hotelsList){

            Integer roomNum = 1;
            for(Room__c r :h.Rooms__r){

            r.Room_Number__c = roomNum;
            updateListRoom.add(r);
            roomNum++;

            }
        }
        update updateListRoom;

    }

}