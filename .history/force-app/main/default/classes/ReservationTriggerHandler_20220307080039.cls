public class ReservationTriggerHandler {


    public static list<Room__c> endReservation{



    
    }

    // Create task to update Room Information

    public static void afterInsertUpdateRoomAvailability(List<Reservation__c> reservations){

    // Store all rooms from New reservations list
        set<Id> roomList = new set<Id>();
        list<Room__c> updateListRoom = new list<Room__c>();

        for(Reservation__c rl :reservations){

            if(rl.Check_In_Date__c == date.today()){
                roomList.add(rl.Room__c);
            }
        }

        for(Room__c r: [Select Id,Name from Room__c WHERE Id IN: roomList]){

            r.Available__c = false;
            r.occupied__c = true;

            updateListRoom.add(r);
        }
        update updateListRoom;

    }

    // Create Default Reservation Item for new Reservation

    public static void createReservationItem(List<Reservation__c> reservations){

        List<Reservation_line_item__c> newReservations = new list<Reservation_line_item__c>();

        PricebookEntry defaultPricebook = [Select Id,Name,Product2Id,UnitPrice from PricebookEntry WHERE Product2Id = '01t7Q000000VIqvQAG'];


        list<Reservation__c> reservationQuery= [SELECT Id,Name,Guest_name__r.Name,Guest_name__r.Discount__c FROM Reservation__c WHERE Id IN: reservations];

        map<Id,Reservation__c> reservationMap = new map<Id,Reservation__c>(reservationQuery);

        for(Reservation__c r: reservations){

            Reservation_line_item__c rlineItem = new Reservation_line_item__c(
                Name = r.Name + ' - ' + r.Days_number__c + ' stay. ' + reservationMap.get(r.Id).Guest_name__r.Name,
                Product__c = defaultPricebook.Product2Id,
                Reservation__c = r.Id,
                Quantity__c = r.Days_number__c,
                Discount__c = reservationMap.get(r.Id).Guest_name__r.Discount__c,
                List_Price__c =  defaultPricebook.UnitPrice * r.Days_number__c,
                Total_Price__c = (defaultPricebook.UnitPrice * r.Days_number__c) * (1 - (reservationMap.get(r.Id).Guest_name__r.Discount__c/100))
            );
            newReservations.add(rlineItem);
        }

        insert newReservations;

    }


    public static void checkIfRoomAvailable(List<Reservation__c> reservations){


    // Store all rooms from New reservations list
        List<Id> roomList = new list<Id>();

        for(Reservation__c rl :reservations){
        roomList.add(rl.Room__c);
        }


        map<Id,list<Reservation__c>> roomReservations = new map<Id,list<Reservation__c>>();

        list<Room__c> roomWithReservations = [SELECT Id, Name, (SELECT Id, Name, Check_In_Date__c, Check_out_Date__c, Room__c FROM Reservations__r) FROM Room__c WHERE Id IN : roomList];

        for(Room__c r : roomWithReservations ){

        roomReservations.put(r.Id,r.Reservations__r);

        }

        set<Reservation__c> resInvalid = new set<Reservation__c>();
        set<Reservation__c> dupes = new set<Reservation__c>();

        for(Reservation__c res : reservations){

            for(Reservation__c checkDupe : roomReservations.get(res.Room__c)){


                if(
                    (res.Check_In_Date__c >= checkDupe.Check_In_Date__c && res.Check_In_Date__c < checkDupe.Check_out_Date__c) ||
                    (res.Check_out_Date__c > checkDupe.Check_In_Date__c && res.Check_out_Date__c <= checkDupe.Check_out_Date__c)
                    ){
                        resInvalid.add(res);
                    }

            }

            set<Reservation__c> rset = new set<Reservation__c>(resInvalid);

            if(resInvalid.size() > 0 && resInvalid.contains(res)){

                res.addError('Room ' + res.Name + ' is already booked at this time. '  + ' Please choose different room or different date.'); // Prevent Create

            }

        }

        }

}