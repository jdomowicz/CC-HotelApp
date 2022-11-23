// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents


//RESTOppty.getOppty('0067R00001v4GRLQA2');


Id accId = [Select Id from Account LIMIT 1].Id;
Id accId = [Select Id from Oppor LIMIT 1].Id;

cloneAccount accLogic = new cloneAccount();
CloneInterface cloneLogic = (CloneInterface).accLogic;

cloneLogic.cloneRecord(accId);
