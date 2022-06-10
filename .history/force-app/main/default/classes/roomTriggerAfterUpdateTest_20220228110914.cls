@IsTest
public class roomTriggerAfterUpdateTest {

    static testMethod void testUnit(){

//Create hotel to test
    Hotel__c h = new hotel__c (
        Name = 'tst',
        City__c = 'Nibylandia',
        total_rooms__c = 5,
        Rooms_Available__c = 5);

        insert h;

    Hotel__c h2 = new hotel__c (
        Name = 'tst',
        City__c = 'Nibylandia2',
        total_rooms__c = 5,
        Rooms_Available__c = 5);

        insert h2;


    list<Room__c> rUpdate = new list<Room__c>();

    // create 160 rooms test
    for(integer i = 0; i<160;i++){
        Room__c r = new Room__c(
            Name = 'test',
            Room_Number__c = i+1,
            Hotel__c = h.Id,
            Available__c = TRUE
            );

        rUpdate.add(r);
        }
        Room__c r2 = new Room__c(
            Name = 'test',
            Room_Number__c = 161,
            Hotel__c = h.Id,
            service__c = true
            );

        rUpdate.add(r2);

        Room__c r3 = new Room__c(
            Name = 'test',
            Room_Number__c = 162,
            Hotel__c = h.Id,
            occupied__c = true
            );

        rUpdate.add(r3);

        Room__c r4 = new Room__c(
            Name = 'test',
            Room_Number__c = 163,
            Hotel__c = h2.Id,
            occupied__c = true,
            service__c = false,
            Available__c = false
            );

        rUpdate.add(r4);


// Performe Test
test.startTest();

    insert rUpdate;

    list<Room__c> UpdateList = [Select Id,Name,Room_Number__c,Hotel__c,service__c,occupied__c,Available__c FROM Room__c];
    list<Room__c> updateListFinal = new list<Room__c>();

    for(Room__c r : UpdateList){

        if(r.Room_Number__c <= 50){

            r.service__c = true;
            r.Available__c = false;
            updateListFinal.add(r);
        }

        else if (r.Room_Number__c > 50 && r.Room_Number__c <= 80){

            r.Available__c = true;
            r.occupied__c = false;
            updateListFinal.add(r);
        }
        else if (r.Room_Number__c == 161){

            r.Available__c = true;
            r.occupied__c = false;
            r.service__c = false;
            updateListFinal.add(r);
        }
        else if (r.Room_Number__c == 162){

            r.Available__c = true;
            r.occupied__c = false;
            r.service__c = false;
            updateListFinal.add(r);
        }
        else {

            r.Available__c = false;
            r.occupied__c = true;
            updateListFinal.add(r);
        }
    }
    update updateListFinal;

Test.stopTest();

Hotel__c hotelData = [Select Id,Rooms_out_of_service__c,Rooms_Available__c,Total_Rented_Rooms__c from Hotel__c];
system.debug(hotelData);

system.assertEquals(33,hotelData.Rooms_Available__c);
system.assertEquals(50,hotelData.Rooms_out_of_service__c);

}

    }

