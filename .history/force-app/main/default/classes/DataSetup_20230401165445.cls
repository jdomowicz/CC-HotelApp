public with sharing class DataSetup {
    
    
    public static updateRoomImg(){
    list<Room__c> roomList = [Select Id,Name from Room__c];

    for(Room__c r: roomList){

        r.photo_url__c = Consts.ROOM_IMAGE.IMAGE_SOURCE.ImageUrl + '/photo' + Integer.valueof((1+ Math.random() * 10)) + '.jpg';
    }

}