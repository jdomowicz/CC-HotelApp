
public class roomTriggerAfterUpdateTest {


    @isTest
    static testMethod void testUnit(){

//Create hotel to test
    Hotel__c h = new hotel__c (
        Name = 'tst',
        City__c = 'Nibylandia',
        total_rooms__c = 5);

        insert h;


    list<Room__c> rUpdate = new list<Room__c>();

    // create 160 rooms test
    for(integer i = 0; i<160;i++){
        Room__c r = new Room__c(
            Name = 'test',
            Room_Number__c = i+1,
            Hotel__c = h.Id
            );

        rUpdate.add(r);
        }


// Performe Test
test.startTest();

    insert rUpdate;

Test.stopTest();

Hotel__c hotelData = [Select Id,Rooms_out_of_service__c,Rooms_Available__c,Total_Rented_Rooms__c from Hotel__c];

system.assertEquals(hotelData.Rooms_Available__c, 160);

}

    }

