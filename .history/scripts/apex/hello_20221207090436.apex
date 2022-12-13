Discount__mdt discount = [select Class_to_Instanciete__c,Customer_Tier__c,Discount__c from Discount__mdt where Customer_Tier__c = 'Bronze'];

Type classType = Type.forName(discount.Class_to_Instanciete__c);

IDiscount newInst = (IDiscount)classType.newInstance();

system.debug(newInst);





class Cont {

    String name;
    String email;
    String toWhoName;

}

Cont m = new Cont();
m.name = 'Marta';
m.email = 'martawalory@gmail.com';
cList.add(m);

Cont a = new Cont();
a.name = 'Asia';
a.email = 'joannapietruszewska@gmail.com';
cList.add(a);

Cont k = new Cont();
k.name = 'Kuba';
k.email = 'jakub.domowicz@icloud.com';
cList.add(k);

list<Cont> cList = new list<Cont>();






system.debug(cList);