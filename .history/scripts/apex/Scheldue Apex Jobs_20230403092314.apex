RoomAvailableScheldule roomAvilableCheckDailyUpdate = new RoomAvailableScheldule();
String schRoom = '0 0 0 1/1 * ? *';
String jobIDRoom = System.schedule('Update Room Availability - Daily', schRoom, roomAvilableCheckDailyUpdate);


hotelMetricsSchedulable hotelMetricsDailyUpdate = new hotelMetricsSchedulable();
String schHotel = '0 22 7 1/1 * ? *';
String jobIDHotel = System.schedule('Schedule Hotel Metrics Daily Update', schHotel, hotelMetricsDailyUpdate);