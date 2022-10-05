trigger caseTrigger on Case (after insert) {


// This lazy dude wrote code to auto-accept and close all cases!

  List<Case> newCases = new List<Case>();

  Id ownerId = [select id from User where Name = 'David Liu' LIMIT 1];

  for (Case a : Trigger.new) {
    a.Status = 'Closed';
    a.OwnerId  = 'David Liu';
    newCases.add(a);
  }

  update newCases;

}



