@isTest
public class RoomAvailableScheldueTest {

 // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        // Create some out of date Opportunity records

        Hotel__c h = new Hotel__c(
        Name = 'Test Hotel',
        City__c = 'Wroclaw'
        );
        insert h;

        Room__c r = new Room__c(
        Name = 'Apex Test',
        Hotel__c = h.Id,
        occupied__c = true,
        Available__c = false
        );
        insert r;

        Reservation__c res = new Reservation__c(
        Name = 'Test reservation',
        Room__c = r.Id,
        Check_In_Date__c = Date.newInstance(2022, 03, 07),
        Check_out_Date__c = Date.newInstance(2022, 03, 08)
        );


        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new RoomAvailableScheldule());
        // Verify the scheduled job has not run yet.
        list<Reservation__c> reservationTest = [Select Id from  Reservation__c WHERE Id =: r.Id];
        System.assertEquals(0, reservationTest.size(), 'Tasks exist before job has run');

        Test.stopTest();

        // Now that the scheduled job has executed,
        // check that our tasks were created
        list<Reservation__c> reservationTest = [Select Id from  Reservation__c WHERE Id =: r.Id];
        
        System.assertEquals(opptyIds.size(),
            lt.size(),
            'Tasks were not created');

}
}