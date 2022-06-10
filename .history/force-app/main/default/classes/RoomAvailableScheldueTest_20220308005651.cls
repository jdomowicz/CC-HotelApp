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
        Check_In_Date__c = Date.newInstance(2022, 03, 08)

        );

}
}