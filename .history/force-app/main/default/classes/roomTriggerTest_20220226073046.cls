
@isTest

public class roomTriggerTest {


@TestSetup
static void makeData(){


    Hotel__c h = new hotel

Room__c r = new room(
Name = 'test',
Room_Number__c = 1,
Hotel__c = ''
);


}

    public roomTriggerTest() {

    }
}
