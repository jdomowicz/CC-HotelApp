class ContctObj {
    String name;
    String email;
    String toWhoName;
    String toWhoEmail;
}

list<ContctObj> cList = new list<ContctObj>();

ContctObj m = new ContctObj();
m.name = 'Marta';
m.email = 'martawalory@gmail.com';

cList.add(m);

ContctObj a = new ContctObj();
a.name = 'Asia';
a.email = 'joannapietruszewska@gmail.com';
cList.add(a);

ContctObj k = new ContctObj();
k.name = 'Kuba';
k.email = 'jakub.domowicz@icloud.com';
cList.add(k);

ContctObj k2 = new ContctObj();
k2.name = 'Krzysztof';
k2.email = 'majchrzak.krzysztof@outlook.com';
cList.add(k2);

ContctObj i = new ContctObj();
i.name = 'Iza';
i.email = 'izabela.domowicz.majchrzak@gmail.com';
cList.add(i);

ContctObj p = new ContctObj();
p.name = 'Patryk';
p.email = 'p.jesiolowski@wp.com';
cList.add(p);

list<String> usedEmails = new list<String>();

map<String,String> userMap = new map<String,String>();

for(ContctObj c :cList){

    userMap.put(cList.email,cList.name);
}

for(ContctObj c: cList){

c.toWhoEmail = cList[(Integer)Math.roundToLong((Math.random() * (cList.size()-1)))].email;

while(c.email == c.toWhoEmail || usedEmails.contains(c.toWhoEmail)){

c.toWhoEmail = cList[(Integer)Math.roundToLong((Math.random() * (cList.size()-1)))].email;
}

c.toWhoName = userMap.get(c.toWhoEmail);

usedEmails.add(c.toWhoEmail);
//system.debug(usedEmails);

system.debug(c);

}