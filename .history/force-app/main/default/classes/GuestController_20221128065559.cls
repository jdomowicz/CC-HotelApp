public class GuestController {

    public static List<Contact> discountCalculator(List<Contact> contacts){

        map<Id,Integer> contactMap = new map<Id,Integer>();

        AggregateResult[] reservatioNumber = [SELECT count(id) reservations_count, Guest_name__c FROM Reservation__c WHERE Check_out_Date__c = LAST_N_DAYS:365 AND Guest_name__c IN:contacts GROUP BY Guest_name__c];

        List<Contact> cList = [SELECT Id,Customer_Status__c from Contact Where Id IN: contacts];

        list<contact> vipContacts = new list<contact>();
        list<contact> standardContacts = new list<contact>();
        list<contact> internalContacts = new list<contact>();

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
        calculatedContacts.addAll(vip.calculateDiscount(vipContacts));

        ContactDiscountStandard standardContacts = new ContactDiscountStandard();
        calculatedContacts.addAll(standardContacts.calculateDiscount(standardContacts));

       // ContactDiscountVIP internalContacts = new ContactDiscountVIP();
       // calculatedContacts.addAll(internalContacts.calculateDiscount(internalContacts));

    return calculatedContacts;
}

@AuraEnabled (cacheable = true)
public static list<Contact> guestListfromReservation(list<String> ids){
    return [SELECT Id,LastName from contact where Id IN (SELECT Guest_name__c from Reservation__c WHERE id =: ids)];
}

}