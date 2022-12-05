// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents


//RESTOppty.getOppty('0067R00001v4GRLQA2');

Id usrId = [SELECT iD from User LIMIT 1].Id;

list<Opportunity> oppList = new list<Opportunity>();

Opportunity opp = new Opportunity(
    Name = 'test Oppty 1',
    Type= 'Sales',
    CloseDate = date.newInstance(2023, 12, 12),
    OwnerId = usrId
);

Opportunity opp2 = new Opportunity(
    Name = 'test Oppty 2',
    Type= 'Service',
    CloseDate = date.newInstance(2023, 12, 12),
    OwnerId = usrId
);

oppList.add(opp);
oppList.add(opp2);
system.debug(oppList);


caseClose