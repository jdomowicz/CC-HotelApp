public class roomMaintenance {
  public class roomType {
    String name;
    String url;
  }

  public static void generateRooms(list<Hotel__c> hotelList) {
    //Prepare data
    list<Hotel__c> queryList = [
      SELECT Id, Name
      FROM Hotel__c
      WHERE Id IN :hotelList
    ];
    //Create list to upload
    list<Room__c> uploadList = new List<Room__c>();
    //Available rooms

    list<String> roomTypes = new List<String>{
      'Single',
      'Double',
      'King',
      'President Suite'
    };

    list<roomType> roomList = new List<roomType>();

    for (Integer i = 1; i <= roomTypes.size(); i++) {
      roomType r = new roomType();
      r.name = roomTypes[i - 1];
      r.url =
        '/resource/1654680741000/rooms_photos/photo' +
        Integer.valueof((Math.random() * 10)) +
        '.jpg';
      roomList.add(r);
    }

    for (Hotel__c h : queryList) {
      for (Integer i = 1; i <= roomList.size(); i++) {
        Room__c ht = new Room__c(
          Hotel__c = h.Id,
          Name = roomList[i - 1].name + ' Room ' + h.Name,
          Type__c = roomList[i - 1].name,
          Mini_Bar__c = true,
          Available__c = true,
          Air_Condition__c = true,
          tv__c = true,
          Room_Number__c = i,
          jacuzzi__c = roomList[i - 1].name == 'President Suite' ? true : false,
          photo_url__c = roomList[i - 1].url,
          Max_Number_of_Guests__c = roomList[i - 1].name == 'President Suite'
            ? 5
            : roomList[i - 1].name == 'King'
                ? 4
                : roomList[i - 1].name == 'Double' ? 2 : 1
        );
        uploadList.add(ht);
      }
    }
    insert uploadList;
  }

  public static void updateHotelRoomsCount(List<Hotel__c> hotelList) {
    AggregateResult[] aggRooms = [
      SELECT Hotel__c, count(Id) ct
      FROM Room__c
      WHERE Hotel__c IN :hotelList
      GROUP BY Hotel__c
    ];

    map<String, Integer> hotelwithRoomCount = new Map<String, Integer>();
    list<Hotel__c> updateListHotels = new List<Hotel__c>();

    for (AggregateResult agg : aggRooms) {
      hotelwithRoomCount.put(
        String.valueOf(agg.get('Hotel__c')),
        Integer.valueOf(agg.get('ct'))
      );
    }
    list<Hotel__c> hotelsList = [
      SELECT ID, (SELECT Id FROM Rooms__r)
      FROM Hotel__c
      WHERE id IN :hotelwithRoomCount.keySet()
    ];

    for (Hotel__c h : hotelsList) {
      h.total_rooms__c = hotelwithRoomCount.get(h.Id);
      updateListHotels.add(h);
    }
    update updateListHotels;
  }

  public static void updateRoomNumbers(List<Hotel__c> hotelList) {
    AggregateResult[] aggRooms = [
      SELECT Hotel__c, count(Id) ct
      FROM Room__c
      WHERE Hotel__c IN :hotelList
      GROUP BY Hotel__c
    ];

    map<String, Integer> hotelwithRoomCount = new Map<String, Integer>();
    list<Room__c> updateListRoom = new List<Room__c>();

    for (AggregateResult agg : aggRooms) {
      hotelwithRoomCount.put(
        String.valueOf(agg.get('Hotel__c')),
        Integer.valueOf(agg.get('ct'))
      );
    }

    list<Hotel__c> hotelsList = [
      SELECT ID, (SELECT Id FROM Rooms__r)
      FROM Hotel__c
      WHERE id IN :hotelwithRoomCount.keySet()
    ];

    for (Hotel__c h : hotelsList) {
      Integer roomNum = 1;
      for (Room__c r : h.Rooms__r) {
        r.Room_Number__c = roomNum;
        updateListRoom.add(r);
        roomNum++;
      }
    }
    update updateListRoom;
  }
}
