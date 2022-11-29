public with sharing class ContactDiscountVIP implements IContactDiscount {

    public list<contact> calculateDiscount(String CustomerDiscount){

        list<contact> contactList = new list<contact>();

         for(contact c: contacts){

            c.Discount__c = 40;
            contactList.add(c);

        }

        return contactList;
    }
}
