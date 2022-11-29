public with sharing class ContactTriggerHandler {


    public static void afterUpdate(list<Contact> newContact, map<Id,contact> oldContact){


        list<contact> customerStatusRecalc = new list<c>
        for(contact c : newContact){

            if(c.Customer_Status__c != oldContact.get(c.Id).Customer_Status__c){



                Guest_Service.discountCalculator()
            }

        }


    }

}
