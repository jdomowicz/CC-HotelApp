public class GuestController {


    public static void discountCalculator(map<Contact,Integer> contacts){

        for(Contact c : contacts.keySet()){

           if(contacts.get(c.Id) > 5 ){

            c.Discount__c = 30;

           }
           else if(contacts.get(c.Id) > 3 ){

            c.Discount__c = 20;

           }
           else if(contacts.get(c.Id) > 1 ){

            c.Discount__c = 10;

           }

           else {

            c.Discount__c = 10;

           }




    }


}
