public with sharing class hotelMetricsSchedulable implements Schedulable {
   global class BatchScheduleUpdate
{
    global void execute(SchedulableContext sc)
    {
        // Implement any logic to be scheduled
       
        // We now call the batch class to be scheduled
        BatchContactUpdate b = new BatchContactUpdate ();
       
        //Parameters of ExecuteBatch(context,BatchSize)
        database.executebatch(b,200);
    }
   
}
}
