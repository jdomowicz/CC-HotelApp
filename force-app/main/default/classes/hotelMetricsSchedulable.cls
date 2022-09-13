public with sharing class hotelMetricsSchedulable implements Schedulable {

    public void execute(SchedulableContext sc)
    {
        // Implement any logic to be scheduled
        // We now call the batch class to be scheduled
        updateHotelMetricsBatchable b = new updateHotelMetricsBatchable ();

        //Parameters of ExecuteBatch(context,BatchSize)
        database.executebatch(b,200);
    }


}