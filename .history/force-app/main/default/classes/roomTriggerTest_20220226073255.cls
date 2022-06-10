
@isTest

public class roomTriggerTest {


@TestSetup
static void makeData(){


Hotel__c h = new hotel__c (Name = 'tst',City__c = 'Nibylandia', Rooms_Available__c = 5);
insert h;
list<Room__c> rUpdate = new list<Room__c>();

for(integer i = 0; i<150;i++){
Room__c r = new room(
Name = 'test',
Room_Number__c = 1,
Hotel__c = h.Id
);
rUpdate.add();

}



}

    public roomTriggerTest() {

    }
}
