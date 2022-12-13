
class Cont {

    String name;
    String email;
    String toWhoName;

}

list<Cont> cList = new list<Cont>();
list<Cont> contactAssigned = new list<Cont>();

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

system.debug('Random num is '+ Math.roundToLong((Math.random() * 6)));

for(Cont c: cList){

system.debug( 'cList size  is '+  cList.size());
system.debug('Index: ' + cList.indexOf(c));
system.debug('Random num is '+ Math.roundToLong((Math.random() * cList.size())));

list<Integer> numAvailable = new list<Integer>{1,2,3,4,5,6};
numAvailable.remove(cList.indexOf(c));


}


public static Integer numReturn(Integer contactIndex, list<Integer> allNumbers){

        integer randomNumber;

    if(contactIndex != Math.roundToLong((Math.random() * allNumbers,size()))){

        randomNumber = randomContactReturned;

    }
    else {
        randomNumber = Math.roundToLong((Math.random() * allNumbers,size()));
    }

    return randomNumber;

}