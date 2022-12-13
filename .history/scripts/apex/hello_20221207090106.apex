Discount__mdt discount = [select Class_to_Instanciete__c,Customer_Tier__c,Discount__c from Discount__mdt where Customer_Tier__c = 'Bronze'];

Type classType = Type.forName(discount.Class_to_Instanciete__c);

IDiscount newInst = (IDiscount)classType.newInstance();

system.debug(newInst);





class Cont {

    String name;
    String email;
    String toWhoName;

}

Cont m = new Cont(name = 'Marta',email='martawalory@gmail.com');
Cont a = new Cont(name = 'Asia',email='jaonna.pietruszewska@gmail.com');

list<Cont> cList = new list<Cont>();


cList.add();