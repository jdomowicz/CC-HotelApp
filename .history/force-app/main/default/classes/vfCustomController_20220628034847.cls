public with sharing class vfCustomController {

    String myname = 'Kuba';


    public string getName() {
        return myname;

    }

    public list<Account> getAccList(){
        return [SELECT Id, Name from Account];
    }

      public list<Opportunity> getAccList(){
        return [SELECT Id, Name from Account];
    }

}
