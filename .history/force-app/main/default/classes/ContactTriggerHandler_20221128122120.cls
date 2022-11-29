public with sharing class ContactTriggerHandler {


    public static list<contact> beforeUpdate(list<Contact> newContact, map<Id,contact> oldMap){


        list<contact> updatedContacts = new list<contact>();
        list<contact> customerStatusRecalc = new list<contact>();

        for(contact c : newContact){

            if(c.Customer_Status__c != oldMap.get(c.Id).Customer_Status__c){

                system.debug('New Customer Status != old record');

                customerStatusRecalc.add(c);
            }

        }

        if(!customerStatusRecalc.isEmpty()){

        updatedContacts = Guest_Service.discountCalculator(customerStatusRecalc);

        }

        return updatedContacts;

    }

}
