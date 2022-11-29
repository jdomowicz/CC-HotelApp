public with sharing class ContactDiscountVIP implements IContactDiscount {

    public list<contact> calculateDiscount(list<Id> contactId){

        for(contact c : contactId){

            c.Discount__c = 40;
            
        }
    }
}
