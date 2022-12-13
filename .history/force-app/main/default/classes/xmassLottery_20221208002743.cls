public with sharing class xmassLottery {


public xmassLottery(){

    list<ContObj> cList = new list<ContObj>();

ContObj m = new ContObj();
m.name = 'Marta';
m.email = 'martawalory@gmail.com';

cList.add(m);

ContObj a = new ContObj();
a.name = 'Asia';
a.email = 'joannapietruszewska@gmail.com';
cList.add(a);

ContObj k = new ContObj();
k.name = 'Kuba';
k.email = 'jakub.domowicz@icloud.com';
cList.add(k);

ContObj k2 = new ContObj();
k2.name = 'Krzysztof';
k2.email = 'majchrzak.krzysztof@outlook.com';
cList.add(k2);

ContObj i = new ContObj();
i.name = 'Iza';
i.email = 'izabela.domowicz.majchrzak@gmail.com';
cList.add(i);

ContObj p = new ContObj();
p.name = 'Patryk';
p.email = 'p.jesiolowski@wp.com';
cList.add(p);


}


    class ContObj {
    String name;
    String email;
    String toWhoName;
    String toWhoEmail;
}



list<String> usedEmails = new list<String>();

map<String,String> userMap = new map<String,String>();

for(ContObj c :cList){

    userMap.put(c.email,c.name);
}

for(ContObj c: cList){

c.toWhoEmail = cList[(Integer)Math.roundToLong((Math.random() * (cList.size()-1)))].email;

while(c.email == c.toWhoEmail || usedEmails.contains(c.toWhoEmail)){

c.toWhoEmail = cList[(Integer)Math.roundToLong((Math.random() * (cList.size()-1)))].email;
}

c.toWhoName = userMap.get(c.toWhoEmail);

usedEmails.add(c.toWhoEmail);

system.debug(c);

}
}
