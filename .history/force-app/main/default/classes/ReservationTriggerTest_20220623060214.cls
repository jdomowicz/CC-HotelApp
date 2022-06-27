@isTest(SeeAllData=true)

public class ReservationTriggerTest {

    @isTest(SeeAllData=true) static void testMethod1() {


       PricebookEntry defaultPricebook = [Select Id,Name,Product2Id,UnitPrice from PricebookEntry WHERE Product2Id = '01t7Q000000VIqvQAG'];
       Contact guest = [SELECT Id,Name,FirstName,LastName from Contact WHERE id = '0037Q0000068d7EQAQ'];


       Contact testContact = new Contact(
            FirstName = 'Test',
            LastName = 'Contact',
            Discount__c = 0
       );

       insert testContact;

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
            Guest_name__c = testContact.Id,
            Room__c = testRoom.Id,
            Check_In_Date__c = date.newInstance(2022, 3, date.today().day()),
            Check_out_Date__c = date.newInstance(2022, 3, date.today().day()),
            Cancelation_fee_covered__c = false
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
            Room__c = testRoom.Id,
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

      //  System.assertEquals(2, testReservations.size());


        Reservation__c r1 = new Reservation__c(
            Name = 'Reservation  test f',
            Guest_name__c = guest.Id,
            Room__c = testRoom.Id,
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

    list<Reservation__c> rtest = [select id,Name,Check_In_Date__c,Check_out_Date__c from Reservation__c WHERE Room__c =: testRoom.Id];
    room__c roomTest = [SELECT id,Available__c,occupied__c from Room__c WHERE id =: testRoom.Id];

    system.deb
    system.assertEquals(2,rtest.size());
    system.assertEquals(roomTest.occupied__c,true);


        // test delete reservation

    Reservation__c delReservation = [SELECT Id,Name from Reservation__c WHERE Name = 'Reservation TestSetup'];

     try {
           delete delReservation;
        }
        catch(DmlException d1){

            system.debug(d1.getMessage());
            Boolean expectedExceptionThrown =  d1.getMessage().contains('You can not cancel this reservation') ? true : false;
            system.assertEquals(expectedExceptionThrown, true);
        }


    Reservation__c r1delete = new Reservation__c(
            Name = 'Reservation  test f',
            Guest_name__c = guest.Id,
            Room__c = testRoom.Id,
            Check_In_Date__c =  date.newInstance(2022, 5, 22),
            Check_out_Date__c = date.newInstance(2022, 5, 27),
            Cancelation_fee_covered__c = false,
            Breakfast__c = true,
            Breakfast_Type__c = 'Vegetarian'
        );

        try{
            insert r1delete;
        }
        catch(DmlException d3){

            system.debug(d3.getMessage());
        }


        List<Reservation_line_item__c> testBreakfast = [SELECT id,Name from Reservation_line_item__c WHERE Reservation__c =:r1delete.Id];
        system.assertEquals(2, testBreakfast.size());


     try {

           delete r1delete;
        }
        catch(DmlException d2){

            system.debug(d2.getMessage());
            Boolean expectedExceptionThrown =  d2.getMessage().contains('You can not cancel this reservation') ? true : false;
            system.assertEquals(expectedExceptionThrown, false);
        }


}
}