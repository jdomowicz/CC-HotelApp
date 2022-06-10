@isTest
public class RoomAvailableScheldueTest {

 // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        // Create some out of date Opportunity records
        Room__c r = new Room__c(
        Name = 'Apex Test',
        occupied__c = true,
        Available__c = false
        );
        insert r;

}
}