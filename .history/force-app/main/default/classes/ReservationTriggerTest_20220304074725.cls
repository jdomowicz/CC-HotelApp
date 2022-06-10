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

for (Integer i = 0 ;i<75;i++){

    Room__c r1 = new Room(
        Name = 'Test Room i',
        Hotel__c = h1.Id
    );
}
    Room__c r2 = new Room(
        Name = 'Test Room 1',
        Hotel__c = h2.Id
    );

insert h1;
insert h2;
    Reservation__c r1 = new Reservation__c(


    )



    }

}
