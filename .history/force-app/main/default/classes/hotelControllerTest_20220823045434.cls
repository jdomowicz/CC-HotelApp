
@isTest
public with sharing class hotelControllerTest {

    @TestSetup
    static void makeData(){

        Hotel__c h1 = new Hotel__c(Name='Test Hotel',City__c = 'Test City',Country__c = 'Poland');
        insert h1;

    }


    static testMethod void test1(){
        hotelController.roomNumber();


        hotelController.countryList();

}
}
