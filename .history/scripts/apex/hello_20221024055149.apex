// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents


//RESTOppty.getOppty('0067R00001v4GRLQA2');




RESTOppty oppRest = new RESTOppty();
oppRest.postOppty('Test',500);

System.debug(Consts.ACCOUNT.TYPE);


System.debug(Consts.CONTACT.LEAD_SOURCE);


System.debug(Account.sObjectType);


DataFactory d = new DataFactory();

system.debug(d);


DataCreator dc = new DataCreator();
system.debug(dc);


Account acc = (Account) DataCreator.createRecord(Account.sObjectType);



list<Contact> cList = [Select Id, AccountId from Contact];




ContactTriggerHandler.afterInsertHandler(cList);