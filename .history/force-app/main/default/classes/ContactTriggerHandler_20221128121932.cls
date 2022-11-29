public with sharing class ContactTriggerHandler {


    public static list<contact> beforeUpdate(list<Contact> newContact, map<Id,contact> oldMap){


        list<contact> customerStatusRecalc = new list<contact>();

        for(contact c : newContact){

            if(c.Customer_Status__c != oldMap.get(c.Id).Customer_Status__c){

                customerStatusRecalc.add(c);
            }

        }

        if(!customerStatusRecalc.isEmpty()){

        list<contact> updatedContacts = Guest_Service.discountCalculator(customerStatusRecalc);

        }

        return updatedContacts;

    }

}
