
class Cont {
    String name;
    String email;
    String toWhoName;
    String toWhoEmail;
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

map<String,String> assignedPaires = new map <String,String>();

for(Cont c: cList){

c.toWhoEmail = cList[(Integer)Math.roundToLong((Math.random() * (cList.size()-1)))].email;
system.debug(c);

while(c.email == c.toWhoEmail){

c.toWhoEmail = cList[(Integer)Math.roundToLong((Math.random() * (cList.size()-1)))].email;
system.debug(c);

assignedPaires.put(c.email,c.toWhoEmail);

}


}



