RoomAvailableScheldule roomAvilableCheck = new RoomAvailableScheldule();

String sch = '0 0 0 1/1 * ? *';
String jobID = System.schedule('Update Room Availability - Daily', sch, roomAvilableCheck);


hotelMetricsSchedulable roomAvilableCheck = new hotelMetricsSchedulable();

String sch = '0 0 0 1/1 * ? *';
String jobID = System.schedule('Update Room Availability - Daily', sch, roomAvilableCheck);