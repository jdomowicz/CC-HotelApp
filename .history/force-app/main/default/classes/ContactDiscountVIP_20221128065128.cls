public with sharing class ContactDiscountVIP implements IContactDiscount {

    Private IContactDiscount i;

    ContactDiscountVIP(){

        this.i = this.calculateDiscount();


    }

    public list<contact> calculateDiscount(list<contact> contactId){

        list<Contact> contactsToUpdate = new list<Contact>();

        for(contact c : contactId){

            c.Discount__c = 40;
            contactsToUpdate.add(c);
        }

        return contactsToUpdate;
    }
}