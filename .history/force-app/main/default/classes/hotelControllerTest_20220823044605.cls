
@isTest
public with sharing class hotelControllerTest {

    @TestSetup
    static void makeData(){

        Hotel__c h1 = new Hotel__c(Name='Test Hotel',City__c = 'Test City');
        insert h1;

    }


    static @IsTest
    static void methodName(){
        
        Test.startTest();
        System.runAs(contextuser){
            
        }
        Test.stopTest();
        
    }


        hotelController.roomNumber();

    


}
