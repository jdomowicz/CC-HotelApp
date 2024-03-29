public class GuestController {

    public static List<Contact> discountCalculator(List<Contact> contacts){

        map<Id,Integer> contactMap = new map<Id,Integer>();

        AggregateResult[] reservatioNumber = [SELECT count(id) reservations_count, Guest_name__c FROM Reservation__c WHERE Check_out_Date__c = LAST_N_DAYS:365 AND Guest_name__c IN:contacts GROUP BY Guest_name__c];

        List<Contact> cList = [SELECT Id,Customer_Status__c from Contact Where Id IN: contacts];

        list<contacts> vipContacts = new list<contact>();
        list<contacts> standardContacts = new list<contact>();
        list<contacts> internalContacts = new list<contact>();

        for(contact c : cList){

                switch on c.Customer_Status__c{
                    when 'VIP' {
                        vipContacts.add(c);
                    }
                    when 'Standard' {
                        standardContacts.add(c);
                    }
                    when 'Internal Employee' {
                        internalContacts.add(c);
                    }
            }
        }

        list<contact> calculatedContacts = new list<contact>();

        ContactDiscountVIP vip = new ContactDiscountVIP();
        calculatedContacts.add(vip.calculateDiscount(vipContacts));

        ContactDiscountVIP standardContacts = new ContactDiscountVIP();
        calculatedContacts.add(standardContacts.calculateDiscount(standardContacts));

        ContactDiscountVIP standardContacts = new ContactDiscountVIP();
        calculatedContacts.add(standardContacts.calculateDiscount(standardContacts));


        calculatedContacts.add();



        for(AggregateResult agg: reservatioNumber){

            contactMap.put((Id)agg.get('Guest_name__c'),(Integer)agg.get('reservations_count'));
        }

        List<Contact> contactUpdateList = new list<Contact>();

        for(Contact c : cList){

           if((Integer) contactMap.get(c.Id) > 5 ){
            c.Discount__c = 30;

           }
           else if((Integer) contactMap.get(c.Id) > 3 ){
            c.Discount__c = 20;

           }
           else if((Integer) contactMap.get(c.Id) >= 1 ){
            c.Discount__c = 10;
           }
           else {
            c.Discount__c = 0;
           }

       contactUpdateList.add(c);
    }

    return contactUpdateList;
}

@AuraEnabled (cacheable = true)
public static list<Contact> guestListfromReservation(list<String> ids){
    return [SELECT Id,LastName from contact where Id IN (SELECT Guest_name__c from Reservation__c WHERE id =: ids)];
}

}