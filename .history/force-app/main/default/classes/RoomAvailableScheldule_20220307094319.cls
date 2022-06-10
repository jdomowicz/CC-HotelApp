public with sharing class RoomAvailableScheldule implements Schedulable {


    public static String CRON_EXP = '0 0 0 3 9 ? 2022';

public void execute(SchedulableContext ctx) {
      CronTrigger ct = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE occupied__c = true AND ID IN (SELECT Room__c from Reservation__c WHERE Check_out_Date__c = TODAY)];

      System.assertEquals(CRON_EXP, ct.CronExpression);
      System.assertEquals(0, ct.TimesTriggered);
      System.assertEquals('2022-09-03 00:00:00', String.valueOf(ct.NextFireTime));

      Account a = [SELECT Id, Name FROM Account WHERE Name =
                  'testScheduledApexFromTestMethod'];
      a.name = 'testScheduledApexFromTestMethodUpdated';
      update a;
   }
}
