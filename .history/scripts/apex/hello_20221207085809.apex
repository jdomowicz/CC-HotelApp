Discount__mdt discount = [select Class_to_Instanciete__c,Customer_Tier__c,Discount__c from Discount__mdt where Customer_Tier__c = 'Bronze'];

Type classType = Type.forName(discount.Class_to_Instanciete__c);

IDiscount newInst = (IDiscount)classType.newInstance();

system.debug(newInst);





class Cont {

    String Name;
    String 

}