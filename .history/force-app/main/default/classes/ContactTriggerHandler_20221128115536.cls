public with sharing class ContactTriggerHandler {


    public static void afterUpdate(list<Contact> newContact, map<Id,contact> oldContact){


        list<contact> customerStatusRecalc = new list<contact>();

        for(contact c : newContact){

            if(c.Customer_Status__c != oldContact.get(c.Id).Customer_Status__c){

                customerStatusRecalc.add(c);
            }

        }

        if(!customerStatusRecalc.isEmpty()){
        List<contact> contacts = Guest_Service.discountCalculator(customerStatusRecalc);

        update 
        }

    }

}
