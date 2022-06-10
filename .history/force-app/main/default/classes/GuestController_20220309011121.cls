public class GuestController {

    public static List<Contact> discountCalculator(List<Contact> contacts){

        Aff


        List<Contact> contactUpdateList = new list<Contact>();

        for(Contact c : contacts.keySet()){

           if((Integer) contacts.get(c) > 5 ){
            c.Discount__c = 30;

           }
           else if((Integer) contacts.get(c) > 3 ){
            c.Discount__c = 20;

           }
           else if((Integer) contacts.get(c) > 1 ){
            c.Discount__c = 10;
           }
           else {
            c.Discount__c = 0;
           }

       contactUpdateList.add(c);
    }

    return contactUpdateList;

}

}
