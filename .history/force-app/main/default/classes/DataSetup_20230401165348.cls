public with sharing class DataSetup {
    
    list<Room__c> roomList = [Select Id,Name from Room__c];

    for(Room__c r: roomList)

}