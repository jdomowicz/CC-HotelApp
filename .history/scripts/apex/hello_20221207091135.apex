Discount__mdt discount = [select Class_to_Instanciete__c,Customer_Tier__c,Discount__c from Discount__mdt where Customer_Tier__c = 'Bronze'];

Type classType = Type.forName(discount.Class_to_Instanciete__c);

IDiscount newInst = (IDiscount)classType.newInstance();

system.debug(newInst);





class Cont {

    String name;
    String email;
    String toWhoName;

}

list<Cont> cList = new list<Cont>();
list<Cont> contactAlreadyUsed = new list<Cont>();

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

Cont k2 = new Cont();
k2.name = 'Krzysztof';
k2.email = 'majchrzak.krzysztof@outlook.com';
cList.add(k2);

Cont i = new Cont();
i.name = 'Iza';
i.email = 'izabela.domowicz.majchrzak@gmail.com';
cList.add(i);

Cont p = new Cont();
p.name = 'Patryk';
p.email = 'p.jesiolowski@wp.com';
cList.add(p);

system.debug((Math.random() * 6));

for(Con c: cList){

    list<>

    c.toWhoName = Integer.valueof((Math.random() * 6))

}