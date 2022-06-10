@isTest(SeeAllData=true)

public class ReservationTriggerTest {

    @isTest(SeeAllData=true) static void testMethod1() {


       PricebookEntry defaultPricebook = [Select Id,Name,Product2Id,UnitPrice from PricebookEntry WHERE Product2Id = '01t7Q000000VIqvQAG'];
       Contact guest = [SELECT Id,Name,FirstName,LastName from Contact WHERE id = '0037Q0000068d7EQAQ'];


       Contact testContact = new Contact(
            Name = 'Test contact',
            FirstName = 'Test',
            last

       );

       Hotel__c testHotel = new Hotel__c(
           Name = 'Test',
           City__c = 'Test city'
       );

       insert testHotel;

       Room__c testRoom = new Room__c(
        Name = 'test Room',
        Hotel__c = testHotel.Id
       );

       insert testRoom;

        Reservation__c rr = new Reservation__c(
            Name = 'Reservation TestSetup',
            Guest_name__c = guest.Id,
            Room__c = testRoom.Id,
            Check_In_Date__c = date.newInstance(2022, 3, 07),
            Check_out_Date__c = date.newInstance(2022, 3, 28)
        );


try{
    insert rr;
}

catch(DmlException e)
{
    system.debug(e.getMessage());
}



      List<Reservation__c> newReservations = new list<Reservation__c>();

    for(integer i = 1; i<3;i++){

            Reservation__c r = new Reservation__c(
            Name = 'Reservation ' + i,
            Guest_name__c = guest.Id,
            Room__c = room.Id,
            Check_In_Date__c =  i > 1 ? date.newInstance(2022, 3, 22) : date.newInstance(2022, 4, 22),
            Check_out_Date__c = i > 1 ? date.newInstance(2022, 3, 27) : date.newInstance(2022, 4, 27)
        );

        newReservations.add(r);
    }

        try {
           // Database.Insert(newReservations, false);
           Insert newReservations;
        }
        catch(DmlException e){

            system.debug(e.getMessage());
            Boolean expectedExceptionThrown =  e.getMessage().contains('Please choose different room or different date.') ? true : false;
            system.assertEquals(expectedExceptionThrown, true);
        }

        list<Reservation__c> testReservations = [Select Id,Name,Check_In_Date__c,Check_out_Date__c,Room__c From Reservation__c WHERE Room__c =: testRoom.Id];

        system.debug(testReservations);

      //  System.assertEquals(2, testReservations.size());


        Reservation__c r1 = new Reservation__c(
            Name = 'Reservation  test f',
            Guest_name__c = guest.Id,
            Room__c = room.Id,
            Check_In_Date__c =  date.newInstance(2022, 4, 22),
            Check_out_Date__c = date.newInstance(2022, 4, 27)
        );

        try {
           // Database.Insert(newReservations, false);
           Insert r1;
        }
        catch(DmlException f){

            system.debug(f.getMessage());
}

    list<Reservation__c> rtest = [select id,Name from Reservation__c WHERE Room__c =: testRoom.Id];
    room__c roomTest = [SELECT id,Available__c,occupied__c from Room__c WHERE id =: testRoom.Id];
    system.assertEquals(rtest.size(),1);
    system.assertEquals(roomTest.occupied__c,true);

        //system.debug(rtest);

}
}