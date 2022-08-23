@isTest(SeeAllData=true)
public class RoomAvailableScheldueTest {

 // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 24 8 ? 2022';
    @isTest(SeeAllData=true) static void testScheduledJob() {

        Hotel__c h1 = new Hotel__c(Name = 'Test Hotel', City__c = 'Test City');
            insert h1;

        Room__c r1 = new Room__c (Name='Test Room 1',Hotel__c = h1.Id);
            insert r1;

        Contact c1 = new Contact(FirstName = 'Test',LastName='User',Discount__c=0);
            insert c1;

        Reservation__c res = new Reservation__c(
        Name = 'Test reservation',
        Room__c = r1.Id,
        Check_In_Date__c = date.newInstance(Date.today().year(), Date.today().month(), date.today().day()-2),
        Check_out_Date__c = date.newInstance(Date.today().year(), Date.today().month(), date.today().day()+1),
        Guest_name__c = c1.Id
        );
        insert res;

        Reservation__c res2 = new Reservation__c(
        Name = 'Test reservation',
        Room__c = r1.Id,
        Check_In_Date__c = date.newInstance(Date.today().year(), Date.today().month(), date.today().day()+3),
        Check_out_Date__c = date.newInstance(Date.today().year(), Date.today().month(), date.today().day()+5),
        Guest_name__c = c1.Id
        );
        insert res2;

        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new RoomAvailableScheldule());
        // Verify the scheduled job has not run yet.
        list<Reservation__c> reservationTestBefore = [Select Id from  Reservation__c WHERE Room__c =: r1.Id];
        system.debug(reservationTestBefore);
        System.assertEquals(2, reservationTestBefore.size(), 'Tasks exist before job has run');

        list<Room__c> reservationTestAfter = [Select Id from  Room__c WHERE Available__c = true AND id =: r1.Id];
        system.debug(reservationTestBefore);
        System.assertEquals(1,reservationTestAfter.size(),'This room is available');

        Test.stopTest();

        // Now that the scheduled job has executed,
        // check that our tasks were created
        list<Room__c> reservationTestAfter = [Select Id from  Room__c WHERE Available__c = true AND id =: r1.Id];
        system.debug(reservationTestBefore);
        System.assertEquals(0,reservationTestAfter.size(),'This room is no longer available');

}
}