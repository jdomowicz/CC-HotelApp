public with sharing class xmassLottery {


public xmassLottery(){




}


    class ContObj {
    String name;
    String email;
    String toWhoName;
    String toWhoEmail;
}

list<ContObj> cList = new list<ContObj>();



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
