public class roomTriggerAfterUpdateTest {


    @isTest

    static testMethod void testUnit(){

//Create hotel to test
Hotel__c h = new hotel__c (
    Name = 'tst',
    City__c = 'Nibylandia',
    total_rooms__c = 5);
insert h;

// Create 1 room to check against
Room__c r1 = new Room__c(
Name = 'testRoom',
Room_Number__c = 1,
Hotel__c = h.Id
);

insert r1;

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
Room__c r2 = new Room__c(
Name = 'test',
Room_Number__c = 0,
Hotel__c = h.Id
);
rUpdate.add(r2);


// Performe Test
test.startTest();

try{
    insert rUpdate;
    }
    catch(DmlException e){
        Boolean expectedExceptionThrown =  e.getMessage().contains('This room number already exisit:') ? true : false;
        system.assertEquals(expectedExceptionThrown, true);
    }


Test.stopTest();

list<Room__c> roomsInserted = [Select Id from Room__c];
system.assertEquals(1, roomsInserted.size());

}

    }
}
