@isTest(SeeAllData=true)

public class ReservationTriggerTest {

    @isTest(SeeAllData=true) static void testMethod1() {


       Hotel__c hotel = [SELECT Id,Name from Hotel__c WHERE Id = 'a007Q000004E0lQQAS'];
       Room__c room = [SELECT Id,Name from Room__c WHERE Id = 'a017Q00000QksHvQAJ'];
       

        Reservation__c rr = new Reservation__c(
            Name = 'Reservation TestSetup',
            Guest_name__c = c1.Id,
            Room__c = r1.Id,
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

      Contact guestId = [SELECT Id FROM Contact WHERE Id =: c1.Id];
      List<Reservation__c> newReservations = new list<Reservation__c>();
      Room__c roomsList = [SELECT Id,Name from Room__c WHERE id =: r1.Id];

    for(integer i = 0; i<150;i++){

            Reservation__c r = new Reservation__c(
            Name = 'Reservation ' + i,
            Guest_name__c = guestId.Id,
            Room__c = roomsList.Id,
            Check_In_Date__c =  i < 100 ? date.newInstance(2022, 3, 22) : date.newInstance(2022, 4, 22),
            Check_out_Date__c = i < 100 ? date.newInstance(2022, 3, 27) : date.newInstance(2022, 4, 27)
        );

        newReservations.add(r);

    }

        try {
            insert newReservations;
        }
        catch(DmlException e){
            Boolean expectedExceptionThrown =  e.getMessage().contains('Please choose different room or different date.') ? true : false;
            system.assertEquals(expectedExceptionThrown, true);
        }

        list<Reservation__c> testReservations = [Select Id,Name From Reservation__c WHERE Room__c =: roomsList.Id];

        System.assertEquals(51, testReservations.size());


}
}
