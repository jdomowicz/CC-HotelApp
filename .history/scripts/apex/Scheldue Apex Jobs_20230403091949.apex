RoomAvailableScheldule roomAvilableCheckDailyUpdate = new RoomAvailableScheldule();
String schRoom = '0 21 7 1/1 * ? *';
String jobID = System.schedule('Update Room Availability - Daily', schRoom, roomAvilableCheckDailyUpdate);


hotelMetricsSchedulable hotelMetricsDailyUpdate = new hotelMetricsSchedulable();
String schHotel = '0 21 7 1/1 * ? *';
String jobID = System.schedule('Schedule Hotel Metrics Daily Update', schHotel, hotelMetricsDailyUpdate);