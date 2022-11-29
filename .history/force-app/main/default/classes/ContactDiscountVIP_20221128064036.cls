public with sharing class ContactDiscountVIP implements IContactDiscount {

    public list<contact> calculateDiscount(list<Id> contactId){

        list<Contact> contactsToUpdate = new list<Contact>();

        for(contact c : contactId){

            c.Discount__c = 40;
            contactsToUpdate.add(c);
        }

        return 
    }
}
