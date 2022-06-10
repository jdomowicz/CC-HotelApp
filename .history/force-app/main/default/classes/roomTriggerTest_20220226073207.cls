
@isTest

public class roomTriggerTest {


@TestSetup
static void makeData(){


Hotel__c h = new hotel__c (Name = 'tst',City__c = 'Nibylandia', Rooms_Available__c = 5);
insert h;

for(integer i = 0; i<15)

Room__c r = new room(
Name = 'test',
Room_Number__c = 1,
Hotel__c = h.Id
);




}

    public roomTriggerTest() {

    }
}
