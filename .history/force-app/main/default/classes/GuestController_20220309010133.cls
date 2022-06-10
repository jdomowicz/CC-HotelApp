public class GuestController {


    public static void discountCalculator(map<Contact,Integer> contacts){

        for(Contact c : contacts.keySet()){

           if(contacts.get(c.Id) > 5 ){

            c.Discount__c = 30

           }




    }


}
