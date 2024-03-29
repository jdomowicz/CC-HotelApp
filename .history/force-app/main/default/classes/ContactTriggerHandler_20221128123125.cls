public with sharing class ContactTriggerHandler {


    public static list<contact> beforeUpdate(list<Contact> newContact, map<Id,contact> oldMap){


        map<id,contact> updatedContactsMap;
        list<contact> customerStatusRecalc = new list<contact>();

        for(contact c : newContact){

            if(c.Customer_Status__c != oldMap.get(c.Id).Customer_Status__c){

                system.debug('New Record != old record');

                customerStatusRecalc.add(c);
            }

        }

        if(!customerStatusRecalc.isEmpty()){

            system.debug(customerStatusRecalc);

       map<Id,contact> updatedContactsMap = new map<Id,Contact>(Guest_Service.discountCalculator(customerStatusRecalc);

        system.debug(updatedContacts);

        }

        return updatedContacts;

    }

}
