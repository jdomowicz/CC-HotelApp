@isTest
public class ReservationTriggerTest {



    @TestSetup
    static void makeData(){

        Hotel__c h1 = new Hotel__c(
        Name='Test Hotel',
        City__c = 'Wroclaw'
        );

        Hotel__c h2 = new Hotel__c(
        Name='Test Hotel',
        City__c = 'Bilgoraj'
        );

    insert h1;
    insert h2;
    

    Room__c r1 = new Room(
        Name = 'Test Room',
        Hotel__c = 

    );

    Reservation__c r1 = new Reservation__c(


    )



    }

}
