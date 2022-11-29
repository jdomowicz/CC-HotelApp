public with sharing class ContactTriggerHandler {


    public static void beforeUpdate(list<Contact> newContact, map<Id,contact> oldMap){


        list<contact> customerStatusRecalc = new list<contact>();

        for(contact c : oldContact){

            if(c.Customer_Status__c != newContact.get(c.Id).Customer_Status__c){

                customerStatusRecalc.add(c);
            }

        }

        if(!customerStatusRecalc.isEmpty()){
        List<contact> contacts = Guest_Service.discountCalculator(customerStatusRecalc);

        }

    }

}
