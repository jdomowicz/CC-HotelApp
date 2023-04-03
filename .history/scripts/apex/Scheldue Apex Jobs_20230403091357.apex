RoomAvailableScheldule roomAvilableCheckDailyUpdate = new RoomAvailableScheldule();

String sch = '0 0 0 1/1 * ? *';
String jobID = System.schedule('Update Room Availability - Daily', sch, roomAvilableCheckDailyUpdate);


hotelMetricsSchedulable hotelMetricsDailyUpdate = new hotelMetricsSchedulable();

String sch = '0 0 0 1/1 * ? *';

String jobID = System.schedule('Update Room Availability - Daily', sch, hotelMetricsDailyUpdate);