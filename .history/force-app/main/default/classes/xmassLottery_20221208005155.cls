public with sharing class xmassLottery {


  list<ContObj> cList = new List<ContObj>();

  public xmassLottery() {
    ContObj m = new ContObj();
    m.name = 'Marta';
    m.email = 'martawalory@gmail.com';

    this.cList.add(m);

    ContObj a = new ContObj();
    a.name = 'Asia';
    a.email = 'joannapietruszewska@gmail.com';
    this.cList.add(a);

    ContObj k = new ContObj();
    k.name = 'Kuba';
    k.email = 'jakub.domowicz@icloud.com';
    this.cList.add(k);

    ContObj k2 = new ContObj();
    k2.name = 'Krzysztof';
    k2.email = 'majchrzak.krzysztof@outlook.com';
    this.cList.add(k2);

    ContObj i = new ContObj();
    i.name = 'Iza';
    i.email = 'izabela.domowicz.majchrzak@gmail.com';
    this.cList.add(i);

    ContObj p = new ContObj();
    p.name = 'Patryk';
    p.email = 'p.jesiolowski@wp.com';
    this.cList.add(p);
  }

  class ContObj {
    String name;
    String email;
    String toWhoName;
    String toWhoEmail;
  }

  public void sendEmailsLotteryResults() {
    list<String> usedEmails = new List<String>();

    map<String, String> userMap = new Map<String, String>();

    for (ContObj c : cList) {
      userMap.put(c.email, c.name);
    }

    for (ContObj c : cList) {
      c.toWhoEmail = cList[
          (Integer) Math.roundToLong((Math.random() * (cList.size() - 1)))
        ]
        .email;

      while (c.email == c.toWhoEmail || usedEmails.contains(c.toWhoEmail)) {
        c.toWhoEmail = cList[
            (Integer) Math.roundToLong((Math.random() * (cList.size() - 1)))
          ]
          .email;
      }

      c.toWhoName = userMap.get(c.toWhoEmail);

      usedEmails.add(c.toWhoEmail);

      system.debug(c);
    }



    // wrap to email class and dispatch

    for(ContObj contact : cList){

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        String[] toAddresses = new String[] {'user@acme.com'}; 
        
        mail.setToAddresses('jakub.domowicz@icloud.com');
        mail.setReplyTo('jakub.domowicz@icloud.com');
        // Specify the name used as the display name.
        mail.setSenderDisplayName('Xmass Lottery Support');


        mail.setSubject('Pierwsza Wroclawska Loteria Swiateczna');

        mail.setHtmlBody('<p>Wesolych Swiat Kuba,</p> <p>Pierwsza Edycja Loteri Swiatecznej zbliza sie wielkimi krokami!</p> <p>W tym roku osoba dla ktorej wybierzesz upominek to <strong>' + contact.toWhoName + '</strong> :)&nbsp;</p> <p>&nbsp;</p> <p>Dla przypomnienia, kilka zasad:</p> <p>1. Nie zdradzaj nikomu kogo wysolowales.</p> <p>2. Sugerowany budzet na upominek to 200zl</p> <p>3. Have fun!</p> <p>&nbsp;</p> <p>Pozdrawiam,</p>');

        // Send the email you have created.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }




  }


  


}
