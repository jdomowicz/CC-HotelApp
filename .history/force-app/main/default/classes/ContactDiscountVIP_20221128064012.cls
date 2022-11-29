public with sharing class ContactDiscountVIP implements IContactDiscount {

    public list<contact> calculateDiscount(list<Id> contactId){

        list<Contact> c

        for(contact c : contactId){

            c.Discount__c = 40;
            
        }
    }
}
