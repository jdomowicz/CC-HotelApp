public with sharing class Guest_Service {

    public static List<Contact> discountCalculator(List<Contact> contacts){

        /*
        Create list for each type of customer
        */
        list<contact> vipContacts = new list<contact>();
        list<contact> standardContacts = new list<contact>();
        list<contact> internalContacts = new list<contact>();

        list<contact> contactsWithDiscount = new list<Contact>();

        for(contact c :  [SELECT Id,Customer_Status__c from Contact Where Id IN: contacts]){

                switch on c.Customer_Status__c{
                    when 'VIP' {
                        vipContacts.add(c);
                    }
                    when 'Standard' {
                        system.debug('Andt is sstandard!!');
                        standardContacts.add(c);
                    }
                    when 'Internal Employee' {
                        internalContacts.add(c);
                    }
            }
        }


        if(!vipContacts.isEmpty()){
        IContactDiscount vip = (IContactDiscount) new ContactDiscountVIP();
        contactsWithDiscount.addAll(vip.calculateDiscount(vipContacts));
        }

        if(!standardContacts.isEmpty()){
        IContactDiscount standard = (IContactDiscount) new ContactDiscountStandard();
        contactsWithDiscount.addAll(standard.calculateDiscount(standardContacts));
        }

        if(!internalContacts.isEmpty()){
        IContactDiscount internal = (IContactDiscount) new contactDiscountInternal();
        contactsWithDiscount.addAll(internal.calculateDiscount(internalContacts));
        }


    return contactsWithDiscount;
}
}
