public class roomMaintenance {

    public class roomType{
        String name;
        String url;}

    public static void generateRooms(list<Hotel__c> hotelList){
        //Prepare data
        list<Hotel__c> queryList = [Select Id,Name from Hotel__c where Id IN: hotelList];
        //Create list to upload
        list<Room__c> uploadList = new list <Room__c>();
        //Available rooms

       list<roomType> roomList = new list<roomType>();

       roomType r1 = new roomType();
        r1.name = 'Single';
        r1.url = '/resource/1654680741000/rooms_photos/photo' + '1.jpg';
        roomList.add(r1);

        roomType r2 = new roomType();
        r2.name = 'Double';
        r2.url = '/resource/1654680741000/rooms_photos/photo2.jpg';
        roomList.add(r2);

        roomType r3 = new roomType();
        r3.name = 'King';
        r3.url = '/resource/1654680741000/rooms_photos/photo3.jpg';
        roomList.add(r3);

        roomType r4 = new roomType();
        r4.name = 'President Suite';
        r4.url = '/resource/1654680741000/rooms_photos/photo4.jpg';
        roomList.add(r4);

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
        photo_url__c = roomList[i-1].url
        );
      uploadList.add(ht);
        }
    }
       insert uploadList;
    }


    public static void updateHotelRoomsCount() {


        AggregateResult[] aggRooms = [SELECT Hotel__c, count(Id) ct FROM Room__c group by Hotel__c];

        map<String,Integer> hotelwithRoomCount = new map<String,Integer>();
        list<Hotel__c> updateListHotels = new list<Hotel__c>();

        for(AggregateResult agg: aggRooms){
        hotelwithRoomCount.put(String.valueOf(agg.get('Hotel__c')), Integer.valueOf(agg.get('ct')));
        }

        list<Hotel__c> hotelsList = [Select ID,(Select Id from Rooms__r) from Hotel__c WHERE id IN: hotelwithRoomCount.keySet()];

        for(Hotel__c h : hotelsList){

            h.total_rooms__c = hotelwithRoomCount.get(h.Id);
        }

        update updateListHotels;

    }

    public static void updateRoomNumbers() {


        AggregateResult[] aggRooms = [SELECT Hotel__c, count(Id) ct FROM Room__c group by Hotel__c];

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