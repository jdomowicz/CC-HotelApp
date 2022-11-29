public with sharing class ContactDiscountVIP implements IContactDiscount {

    public list<contact> calculateDiscount(list<Contact> contacts){
       
        list<contact> contactList = 
         for(contact c: contacts){

            c.Discount__c = 40;
            
        }

        return contactList;
    }
}
