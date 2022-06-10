
@isTest

public class roomTriggerTest {

static testMethod void testUnit(){

//Create hotel to test
Hotel__c h = new hotel__c (
    Name = 'tst',
    City__c = 'Nibylandia',
    Rooms_Available__c = 5);
insert h;
list<Room__c> rUpdate = new list<Room__c>();

// create 160 rooms test
for(integer i = 0; i<160;i++){
Room__c r = new Room__c(
Name = 'test',
Room_Number__c = 1,
Hotel__c = h.Id
);
rUpdate.add(r);
}

test.startTest();
insert rUpdate;
Test.stopTest();

list<Room__c> roomsInserted = [Select Id from Room__c];

system.assertEquals(0, roomsInserted);

}


}
