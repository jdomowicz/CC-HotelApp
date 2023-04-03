RoomAvailableScheldule roomAvilableCheck = new RoomAvailableScheldule();
// Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
String sch = '0 0 0 1/1 * ? *';
String jobID = System.schedule('Remind Opp Owners', sch, reminder);