
@isTest
public with sharing class hotelControllerTest {

    @TestSetup
    static void makeData(){

        Hotel__c h1 = new Hotel__c(Name='Test Hotel',City__c = 'Test City',Country__c = 'Poland');
        insert h1;

    }


    static testMethod void test1(){
        hotelController.roomNumber();

    list<AggregateResult> cList = hotelController.countryList();
    system.assertEquals(cList.size(), 1);

    list<AggregateResult> cList2 = hotelController.CityList('Poland');
    system.debug(cList2);

    String city = cList2[0].get('City__c');

    }


}
