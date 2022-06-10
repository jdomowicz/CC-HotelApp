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

        Room__c r1 = new Room__c(
            Name = 'Test Room 1',
            Hotel__c = h1.Id
        );

        Room__c r2 = new Room__c(
            Name = 'Test Room 1',
            Hotel__c = h2.Id
        );

    insert r1;
    insert r2;

        Contact c1 = new Contact(
            FirstName = 'test',
            LastName = 'Contact'
        );

    insert c1;

        Reservation__c r = new Reservation__c(
            Name = 'Reservation TestSetup',
            Guest_name__c = c1.Id,
            Check_In_Date__c = date.newInstance(2022, 3, 21),
            Check_out_Date__c = date.newInstance(2022, 3, 28)
        )
    insert r;
    }


    @isTest static void testMethod1() {


    for(integer i = 0; i<150;i++){

        Reservation__c r = new Reservation__c(

        Name = 'Reservation ' + i,
        Guest_name__c = c1.Id,
        

        )

    }


    }

}
