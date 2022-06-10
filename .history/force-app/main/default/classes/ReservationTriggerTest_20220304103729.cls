@isTest(SeeAllData=true)

public class ReservationTriggerTest {

    @isTest(SeeAllData=true) static void testMethod1() {


       Hotel__c hotel = [SELECT Id,Name from Hotel__c WHERE Id = 'a007Q000004E0lQQAS'];
       Room__c room = [SELECT Id,Name from Room__c WHERE Id = 'a017Q00000QksHvQAJ'];
       PricebookEntry defaultPricebook = [Select Id,Name,Product2Id,UnitPrice from PricebookEntry WHERE Product2Id = '01t7Q000000VIqvQAG'];
       Contact guest = [SELECT Id,Name,FirstName,LastName from Contact WHERE id = '0037Q0000068d7EQAQ'];

        Reservation__c rr = new Reservation__c(
            Name = 'Reservation TestSetup',
            Guest_name__c = guest.Id,
            Room__c = room.Id,
            Number_of_Days__c = 7,
            Check_In_Date__c = date.newInstance(2022, 3, 21),
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
            Number_of_Days__c = 7,
            Check_In_Date__c =  i > 2 ? date.newInstance(2022, 3, 22) : date.newInstance(2022, 4, 22),
            Check_out_Date__c = i > 2 ? date.newInstance(2022, 3, 27) : date.newInstance(2022, 4, 27)
        );

        newReservations.add(r);
    }
    system.debug(newReservations);

        try {
           // Database.Insert(newReservations, false);
           Insert newReservations;
        }
        catch(DmlException e){

            system.debug(e.getMessage());
            Boolean expectedExceptionThrown =  e.getMessage().contains('Please choose different room or different date.') ? true : false;
            system.assertEquals(expectedExceptionThrown, true);
        }

        list<Reservation__c> testReservations = [Select Id,Name,Check_In_Date__c,Check_out_Date__c,Room__c From Reservation__c WHERE Room__c =: room.Id];

        system.debug(testReservations);

        System.assertEquals(2, testReservations.size());


        Reservation__c r1 = new Reservation__c(
            Name = 'Reservation  test f',
            Guest_name__c = guest.Id,
            Room__c = room.Id,
            Number_of_Days__c = 7,
            Check_In_Date__c =  date.newInstance(2022, 4, 22),
            Check_out_Date__c = date.newInstance(2022, 4, 27)
        );

        try {
           // Database.Insert(newReservations, false);
           Insert r1;
        }
        catch(DmlException e){

            system.debug(e.getMessage());
}

system.debug(r1)

}
}
